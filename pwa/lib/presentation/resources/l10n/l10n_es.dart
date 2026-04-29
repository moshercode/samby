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

  // Splash

  @override
  String get splashAssociationNotFound => 'Asociación no encontrada';
  @override
  String get splashAssociationNotFoundSubtitle => 'El enlace que has usado no corresponde a ninguna asociación registrada en Samby';

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
  String get passwordResetTitle => 'Recuperar contraseña';
  @override
  String get passwordResetSubtitle => 'Te enviaremos un enlace de recuperación a tu email';
  @override
  String get passwordResetSend => 'Enviar enlace';
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
  String get onboardingAssociationName => 'Nombre completo';
  @override
  String get onboardingAssociationShortName => 'Nombre corto';
  @override
  String get onboardingAssociationShortNameHint => 'Ej: La Comparsa';
  @override
  String get onboardingAssociationSubdomain => 'Dirección web';
  @override
  String get onboardingAssociationSubdomainHint => 'Ej: lacomparsa';
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
  String get accessRequestDNI => 'DNI / NIE';
  @override
  String get accessRequestUploadDNI => 'Subir foto del DNI';
  @override
  String get accessRequestDNIUploaded => 'DNI subido correctamente';
  @override
  String get accessRequestMinorWarning => 'Eres menor de edad. Necesitamos los datos de tu tutor legal';
  @override
  String get accessRequestGuardianTitle => 'Datos del tutor legal';
  @override
  String get accessRequestGuardianFullName => 'Nombre completo del tutor';
  @override
  String get accessRequestGuardianDNI => 'DNI del tutor';
  @override
  String get accessRequestUploadGuardianDNI => 'Subir foto del DNI del tutor';
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
}
