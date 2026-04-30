# Samby — Instrucciones para Claude

## Stack

Flutter Web (PWA) + Provider + Firebase Data Connect (PostgreSQL). Arquitectura limpia: domain → data → presentation.

- **PWA del socio**: Flutter Web con subdominio por asociación (`{subdomain}.samby.app`). Routing basado en subdominio para cargar la asociación correcta.
- **Backend**: Firebase Cloud Functions para lógica de negocio y notificaciones. Firebase Data Connect (PostgreSQL) como base de datos.

---

## Arquitectura y estructura

- **Views** (`lib/presentation/views/<feature>/<feature>_view.dart`): solo UI. Sin lógica de negocio. **Deben ser siempre `BaseView<ViewModel>` y tener un ViewModel emparejado**. Usar siempre `SafeScaffold` en vez de `Scaffold`.
- **ViewModels** (`lib/presentation/viewmodels/<feature>/<feature>_viewmodel.dart`): exponen estado y acciones. **Deben ser siempre `ViewModel`**. La inicialización del viewmodel debe hacerse en el método `onStart`.
- **Widgets comunes** (`lib/presentation/widgets/common/`): reutilizables entre features. **Deben ser `StatelessWidget` siempre que sea posible**, ya que los estados se gestionan en el ViewModel. Se permite `StatefulWidget` para estados puramente visuales internos.
- **Domain entities** en `lib/domain/entities/`. Repositories (interfaces) en `lib/domain/repositories/`. Implementations en `lib/data/repositories/`. Datasource en `lib/data/datasources/`.
- **DB**: Firebase Data Connect. Esquema en `firebase/dataconnect/schema/schema.gql`. Queries en `firebase/dataconnect/connector/queries.gql`. Mutations en `firebase/dataconnect/connector/mutations.gql`.
- **Navegación**: `NavigationUtils` — todos los cambios de pantalla pasan por aquí.
- **DI**: GetIt (`sl`). Datasource → `DataconnectDatasource`. Repositorios registrados como singletons.

---

## Convenciones de código

### Estructura de Vistas (Views)

```dart
class XView extends BaseView<XViewModel> {

  // Constructor

  const XView(super.viewModel, {super.key});

  // Build

  @override
  Widget buildView(BuildContext context) { ... }

  // Private methods

  Widget _helper() { ... }
}
```

### Estructura de Clases (ViewModels y Modelos)

```dart
class ClassName {

  // Constants

  ...constants...

  // Variables

  ...variables...
  ...getters...

  // Constructor

  ...constructors...

  // Public methods

  ...public methods...

  // Static methods

  ...static methods...

  // Private methods

  ...private methods...
}
```

### Estructura de StatelessWidget

```dart
class _WidgetName extends StatelessWidget {

  // Variables

  final String foo;

  // Constructor

  const _WidgetName({required this.foo});

  // Build

  @override
  Widget build(BuildContext context) { ... }

  // Private methods

  String _helper() { ... }
}
```

### Estructura de StatefulWidget

```dart
class _WidgetName extends StatefulWidget {

  // Variables

  ...variables...

  // Constructor

  ...constructors...

  // Build — delegar al State
}

class _WidgetNameState extends State<_WidgetName> {

  // Variables

  ...variables...

  // Life cycle

  ...lifecycle methods...

  // Build

  @override
  Widget build(BuildContext context) { ... }

  // Private methods

  ...private methods...
}
```

### Dart / Flutter

- Las constantes de clase comenzarán por `k`, en camelCase. Ej: `kImageHeight`.
- Preferir constructores `const` siempre que sea posible.
- **No números mágicos**: usar siempre `Dimensions.*` para spacing, radius e iconos. Para alturas/anchuras específicas de diseño (p.ej. altura de imagen de portada), definir una constante `static const` en la sección `// Constants` del widget.
- **No colores inline**: usar siempre `Theme.of(context).colorScheme.*`.
- No usar `Scaffold` directamente — siempre `SafeScaffold`.

### Localización

- **Cero strings hardcodeados** en vistas o widgets. Siempre usar `Localization.of(context).<key>`.
- 7 idiomas: es, en, fr, de, pt, it, ca. Archivo abstracto `localization.dart` + `l10n_<code>.dart` en `lib/presentation/resources/l10n/`.
- Al añadir una nueva key: declararla en `localization.dart` e implementarla en los 7 archivos de idioma.
- Strings con apóstrofe (fr, it, ca): usar comillas dobles `"…l'exemple…"`, no simples.
- Siempre añadir `@override` en las implementaciones de los archivos de idioma.
- Usar `Localization.of(context)` — **nunca** acceder al localizador fuera de un `BuildContext`.

### Dimensiones (`Dimensions`)

Spacing disponible: `space2 / space4 / space8 / space12 / space16 / space24 / space32 / space40 / space48 / space64 / space80`.

Layout: `screenMargin = 16`, `modalPadding = 24`.

Icons: `iconSm = 16`, `iconMd = 20`, `iconLg = 24`, `iconXl = 32`, `iconXXl = 48`, `iconXXXl = 64`.

Radius: `radiusXs = 4`, `radiusSm = 6`, `radiusMd = 10`, `radiusLg = 16`, `radiusXl = 24`.

Components: `buttonHeight = 60`, `buttonHeightDense = 32`, `inputHeight = 48`.

Espaciado entre secciones: `space24`. Entre ítems de la misma sección: `space12`.

---

## Base de datos (Firebase Data Connect / PostgreSQL)

- Toda la interacción con la BD pasa por `DataconnectDatasource` → repositorios → viewmodels.
- Las operaciones GQL se definen en los archivos `.gql`. Los nombres de operación se centralizan en `DataconnectOps`, las claves de variables en `DataconnectKeys`, y las claves de respuesta en `DataconnectResponseKeys`.
- Todas las tablas tienen un campo `id` UUID explícito como PK.
- Los timestamps se pasan siempre en UTC ISO8601: `DateTime.now().toUtc().toIso8601String()`.
- Tras cualquier cambio de esquema: hacer deploy con `firebase deploy --only dataconnect`.

### Esquema de tablas

**`Association`** — datos de la asociación (nombre, subdominio, colores, founderEmail).

**`Member`** — usuario de Firebase Auth (email, nombre, teléfono). Anteriormente `AppUser`.

**`AssociationMembership`** — relación socio↔asociación. Campos clave: `role: MemberRole` (enum: `manager` | `member`), `status` (String: `pending` | `approved` | `rejected`), `isBlocked`, `isFounder`, `profileImageUrl`, `phone`, datos del formulario de solicitud.

**`Event`** — evento de la asociación (título, descripción, imagen, startDate, endDate). Los managers lo crean; los socios con acceso lo ven.

**`EventMember`** — tabla de unión Event↔AssociationMembership. Controla qué socios tienen acceso a un evento.

**`CalendarEvent`** — sesión concreta dentro de un Event (título, descripción, eventDate, endDate).

**`UserFcmToken`** — token FCM del usuario para notificaciones push.

**`BroadcastMessage`** — mensajes broadcast de la asociación.

**`AssociationCondition`** — condiciones de adhesión de la asociación (generales / menores).

### Enum `MemberRole`
```graphql
enum MemberRole { manager  member }
```
Se pasa como string desde Dart: `'manager'` / `'member'`.

---

## Inyección de dependencias (GetIt / `sl`)

- `AssociationRepository` → `AssociationRepositoryImpl`
- `MembershipRepository` → `MembershipRepositoryImpl`
- `EventRepository` → `EventRepositoryImpl`

Todos registrados como `registerSingleton` sobre `DataconnectDatasource`.

---

## Workflow

- **Nunca hacer commit** a menos que se pida explícitamente.
- **Nunca ejecutar `flutter pub get`, `build_runner` ni comandos del CLI de Firebase** sin preguntar antes.
- **No corregir warnings preexistentes** a menos que se pida.
- Antes de modificar un archivo, leerlo siempre.
- No crear archivos nuevos si se puede editar uno existente.
- No añadir docstrings ni bloques de comentarios al código no modificado.
