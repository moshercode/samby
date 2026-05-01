import 'package:samby/presentation/resources/l10n/localization.dart';

class L10nEs extends Localization {
  // General

  @override
  String get loading => 'Cargando…';
  @override
  String get errorGeneric => 'Algo ha salido mal. Inténtalo de nuevo';
  @override
  String get errorNetwork => 'Sin conexión. Comprueba tu red';
  @override
  String get cancel => 'Cancelar';
  @override
  String get confirm => 'Confirmar';
  @override
  String get continueLabel => 'Continuar';
  @override
  String get save => 'Guardar';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get fieldTitle => 'Título';
  @override
  String get fieldDescription => 'Descripción';
  @override
  String get clearDate => 'Eliminar fecha';
  @override
  String get selectAll => 'Todos';
  @override
  String get selectNone => 'Ninguno';

  // Splash

  @override
  String get splashBandNotFound => 'Asociación no encontrada';
  @override
  String get splashBandNotFoundSubtitle => 'El enlace que has usado no corresponde a ninguna asociación registrada en Samby';

  // Auth

  @override
  String get authLoginTitle => 'Bienvenido de nuevo';
  @override
  String get authLoginSubtitle => 'Inicia sesión para acceder a tu asociación';
  @override
  String get authRegisterTitle => 'Crear cuenta';
  @override
  String get authRegisterSubtitle => 'Regístrate para solicitar el acceso';
  @override
  String get authFullName => 'Nombre completo';
  @override
  String get authEmail => 'Email';
  @override
  String get authPassword => 'Contraseña';
  @override
  String get authLoginSubmit => 'Iniciar sesión';
  @override
  String get authRegisterSubmit => 'Crear cuenta';
  @override
  String get authSwitchToLogin => '¿Ya tienes cuenta? Inicia sesión';
  @override
  String get authSwitchToRegister => '¿No tienes cuenta? Regístrate';
  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';
  @override
  String get authErrorInvalidData => 'Por favor, rellena todos los campos correctamente';
  @override
  String get authErrorInvalidCredentials => 'Email o contraseña incorrectos';
  @override
  String get authErrorEmailInUse => 'Este email ya está en uso';
  @override
  String get authErrorWeakPassword => 'La contraseña debe tener al menos 6 caracteres';
  @override
  String get authErrorTooManyAttempts => 'Demasiados intentos. Espera un momento';
  @override
  String get authPhone => 'Teléfono';
  @override
  String get authResetCode => 'Código de verificación';
  @override
  String get authNewPassword => 'Nueva contraseña';
  @override
  String get authResetSubmit => 'Cambiar contraseña';
  @override
  String get authErrorResetTokenInvalid => 'Código no válido';
  @override
  String get authErrorResetTokenExpired => 'El código ha caducado';
  @override
  String get authErrorResetTokenUsed => 'El código ya ha sido usado';
  @override
  String get passwordResetTitle => 'Recuperar contraseña';
  @override
  String get passwordResetSubtitle => 'Te enviaremos un código de verificación a tu email';
  @override
  String get passwordResetSend => 'Enviar código';
  @override
  String get passwordResetSentConfirmation => 'Revisa tu correo electrónico';
  @override
  String get passwordResetBack => 'Volver al inicio de sesión';

  // Onboarding

  @override
  String get onboardingTitle => 'Crea tu asociación';
  @override
  String get onboardingSubtitle => 'Configura los datos básicos de tu asociación';
  @override
  String get onboardingBlock1Title => 'Información de la asociación';
  @override
  String get onboardingBandName => 'Nombre completo';
  @override
  String get onboardingBandShortName => 'Nombre corto';
  @override
  String get onboardingBandShortNameHint => 'Ej: La Comparsa';
  @override
  String get onboardingBandSubdomain => 'Dirección web';
  @override
  String get onboardingBandSubdomainHint => 'Ej: lacomparsa';
  @override
  String get onboardingPrimaryColor => 'Color primario';
  @override
  String get onboardingSecondaryColor => 'Color secundario';
  @override
  String get onboardingBlock2Title => 'Condiciones generales';
  @override
  String get onboardingBlock3Title => 'Condiciones para menores';
  @override
  String get onboardingAddCondition => 'Añadir condición';
  @override
  String get onboardingConditionHint => 'Escribe la condición…';
  @override
  String get onboardingSubmit => 'Crear asociación';
  @override
  String get onboardingSubdomainTaken => 'Esta dirección ya está en uso';
  @override
  String get onboardingSubdomainInvalid => 'Solo letras minúsculas, números y guiones';

  // Access request

  @override
  String get accessRequestTitle => 'Solicitar acceso';
  @override
  String get accessRequestSubtitle => 'Rellena el formulario para enviar tu solicitud';
  @override
  String get accessRequestBlock1Title => 'Datos personales';
  @override
  String get accessRequestFullName => 'Nombre completo';
  @override
  String get accessRequestBirthDate => 'Fecha de nacimiento';
  @override
  String get accessRequestBirthDateHint => 'DD/MM/AAAA';
  @override
  String get accessRequestIdDoc => 'DNI / NIE';
  @override
  String get accessRequestUploadIdDoc => 'Subir foto del DNI';
  @override
  String get accessRequestIdDocUploaded => 'DNI subido correctamente';
  @override
  String get accessRequestMinorWarning => 'Eres menor de edad. Necesitamos los datos de tu tutor legal';
  @override
  String get accessRequestGuardianTitle => 'Datos del tutor legal';
  @override
  String get accessRequestGuardianFullName => 'Nombre completo del tutor';
  @override
  String get accessRequestGuardianIdDoc => 'DNI del tutor';
  @override
  String get accessRequestUploadGuardianIdDoc => 'Subir foto del DNI del tutor';
  @override
  String get accessRequestBlock2Title => 'Condiciones';
  @override
  String get accessRequestBlock3Title => 'Firma';
  @override
  String get accessRequestSignatureHint => 'Dibuja tu firma en el recuadro';
  @override
  String get accessRequestClearSignature => 'Borrar firma';
  @override
  String get accessRequestSubmit => 'Enviar solicitud';
  @override
  String get accessRequestSubmitting => 'Enviando solicitud…';

  // Pending approval

  @override
  String get pendingTitle => 'Solicitud enviada';
  @override
  String get pendingSubtitle => 'Tu solicitud está siendo revisada';
  @override
  String get pendingMessage => 'Un manager de la asociación revisará tu solicitud y recibirás una notificación cuando sea aceptada';

  // Rejected

  @override
  String get rejectedTitle => 'Solicitud rechazada';
  @override
  String get rejectedSubtitle => 'Tu solicitud no ha sido aceptada';
  @override
  String get rejectedMessage => 'Si crees que es un error, puedes volver a enviar una solicitud';
  @override
  String get rejectedReapply => 'Volver a solicitar';
  @override
  String get rejectedBlocked => 'No puedes volver a solicitar el acceso a esta asociación';

  // Dashboard

  @override
  String get dashboardTitle => 'Inicio';
  @override
  String get dashboardActiveEvents => 'Eventos';
  @override
  String get dashboardNoEvents => 'No hay eventos activos';
  @override
  String get eventDetailSessions => 'Sesiones';
  @override
  String get eventDetailNoSessions => 'No hay sesiones próximas';
  @override
  String get eventDetailMembers => 'Acceso';
  @override
  String get createEventTitle => 'Nuevo evento';
  @override
  String get createEventStartDate => 'Fecha de inicio';
  @override
  String get createEventEndDate => 'Fecha de fin (opcional)';
  @override
  String get createEventImageLabel => 'Imagen del evento';
  @override
  String get createEventMembersLabel => 'Miembros con acceso';
  @override
  String get createEventSubmit => 'Crear evento';
  @override
  String get createCalendarEventTitle => 'Nueva sesión';
  @override
  String get createCalendarEventDateLabel => 'Fecha de la sesión';
  @override
  String get createCalendarEventSubmit => 'Crear sesión';

  // Home

  @override
  String get homeTabEvents => 'Eventos';
  @override
  String get homeTabMembers => 'Socios';
  @override
  String get homeTabBand => 'Asociación';
  @override
  String get homeTabProfile => 'Perfil';

  // Membership status

  @override
  String get membershipStatusPendingTitle => 'Solicitud enviada';
  @override
  String get membershipStatusPendingMessage => 'Un manager revisará tu solicitud y recibirás una notificación cuando sea aceptada';
  @override
  String get membershipStatusRejectedTitle => 'Solicitud rechazada';
  @override
  String get membershipStatusRejectedMessage => 'Tu solicitud no ha sido aceptada. Puedes enviar una nueva solicitud';
  @override
  String get membershipStatusBlockedMessage => 'No puedes volver a solicitar el acceso a esta asociación';
  @override
  String get membershipStatusReapply => 'Volver a solicitar';
  @override
  String get membershipStatusRefresh => 'Actualizar estado';

  // Events extras

  @override
  String get eventsActive => 'Activos';
  @override
  String get eventsFinished => 'Finalizados';
  @override
  String get eventsEmpty => 'No hay eventos';
  @override
  String get eventDetailFreeEntry => 'Entrada libre';
  @override
  String get eventDetailRequestAccess => 'Solicitar acceso';
  @override
  String get eventDetailAccessPending => 'Solicitud pendiente';
  @override
  String get eventDetailAccessRejected => 'Acceso denegado';
  @override
  String get createEventFreeEntry => 'Entrada libre';
  @override
  String get createEventEntryCondition => 'Condición de entrada';
  @override
  String get createAppointmentTitle => 'Nueva sesión';
  @override
  String get createAppointmentDateLabel => 'Fecha de la sesión';
  @override
  String get createAppointmentSubmit => 'Crear sesión';

  // Association Detail

  @override
  String get bandDetailTitle => 'Asociación';
  @override
  String get bandDetailRequirements => 'Requisitos de solicitud';
  @override
  String get bandDetailRequireIdDoc => 'Requerir DNI';
  @override
  String get bandDetailRequireIdDocImage => 'Requerir imagen del DNI';
  @override
  String get bandDetailRequireGuardian => 'Requerir datos del tutor';

  // Profile

  @override
  String get profileTitle => 'Perfil';
  @override
  String get profileLogout => 'Cerrar sesión';
  @override
  String get profileMemberSince => 'Socio desde';

  // Onboarding extras

  @override
  String get onboardingRequireIdDoc => 'Requerir DNI';
  @override
  String get onboardingRequireIdDocImage => 'Requerir imagen del DNI';
  @override
  String get onboardingRequireGuardian => 'Requerir datos del tutor para menores';

  // Members

  @override
  String get membersTitle => 'Miembros';
  @override
  String get membersEmpty => 'No hay miembros todavía';
  @override
  String get memberStatusPending => 'Pendiente';
  @override
  String get memberStatusApproved => 'Aprobado';
  @override
  String get memberStatusRejected => 'Rechazado';
  @override
  String get memberRoleManager => 'Manager';
  @override
  String get memberRoleMember => 'Socio';
  @override
  String get memberBlocked => 'Bloqueado';

  // Member detail

  @override
  String get memberDetailPersonalInfo => 'Información personal';
  @override
  String get memberDetailEvents => 'Eventos';
  @override
  String get memberDetailNoEvents => 'Sin eventos asignados';
  @override
  String get memberDetailChangeRole => 'Rol';
}
