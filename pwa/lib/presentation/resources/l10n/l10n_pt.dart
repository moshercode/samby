import 'package:samby/presentation/resources/l10n/localization.dart';

class L10nPt extends Localization {
  // General

  @override
  String get loading => 'A carregar…';
  @override
  String get errorGeneric => 'Algo correu mal. Por favor, tente novamente';
  @override
  String get errorNetwork => 'Sem ligação. Verifique a sua rede';
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
  String get fieldDescription => 'Descrição';
  @override
  String get clearDate => 'Limpar data';
  @override
  String get selectAll => 'Todos';
  @override
  String get selectNone => 'Nenhum';

  // Splash

  @override
  String get splashAssociationNotFound => 'Associação não encontrada';
  @override
  String get splashAssociationNotFoundSubtitle => 'O link que utilizou não corresponde a nenhuma associação registada no Samby';

  // Auth

  @override
  String get authLoginTitle => 'Bem-vindo de volta';
  @override
  String get authLoginSubtitle => 'Inicie sessão para aceder à sua associação';
  @override
  String get authRegisterTitle => 'Criar conta';
  @override
  String get authRegisterSubtitle => 'Registe-se para solicitar acesso';
  @override
  String get authFullName => 'Nome completo';
  @override
  String get authEmail => 'Email';
  @override
  String get authPassword => 'Palavra-passe';
  @override
  String get authLoginSubmit => 'Iniciar sessão';
  @override
  String get authRegisterSubmit => 'Criar conta';
  @override
  String get authSwitchToLogin => 'Já tem conta? Iniciar sessão';
  @override
  String get authSwitchToRegister => 'Não tem conta? Registar';
  @override
  String get authForgotPassword => 'Esqueceu a palavra-passe?';
  @override
  String get authErrorInvalidData => 'Por favor, preencha todos os campos corretamente';
  @override
  String get authErrorInvalidCredentials => 'Email ou palavra-passe incorretos';
  @override
  String get authErrorEmailInUse => 'Este email já está em uso';
  @override
  String get authErrorWeakPassword => 'A palavra-passe deve ter pelo menos 6 caracteres';
  @override
  String get authErrorTooManyAttempts => 'Demasiadas tentativas. Aguarde um momento';
  @override
  String get authPhone => 'Telefone';
  @override
  String get authResetCode => 'Código de verificação';
  @override
  String get authNewPassword => 'Nova palavra-passe';
  @override
  String get authResetSubmit => 'Alterar palavra-passe';
  @override
  String get authErrorResetTokenInvalid => 'Código inválido';
  @override
  String get authErrorResetTokenExpired => 'O código expirou';
  @override
  String get authErrorResetTokenUsed => 'O código já foi utilizado';
  @override
  String get passwordResetTitle => 'Recuperar palavra-passe';
  @override
  String get passwordResetSubtitle => 'Enviaremos um código de verificação para o seu email';
  @override
  String get passwordResetSend => 'Enviar código';
  @override
  String get passwordResetSentConfirmation => 'Verifique o seu email';
  @override
  String get passwordResetBack => 'Voltar ao início de sessão';

  // Onboarding

  @override
  String get onboardingTitle => 'Criar a sua associação';
  @override
  String get onboardingSubtitle => 'Configure as informações básicas da sua associação';
  @override
  String get onboardingBlock1Title => 'Informações da associação';
  @override
  String get onboardingAssociationName => 'Nome completo';
  @override
  String get onboardingAssociationShortName => 'Nome curto';
  @override
  String get onboardingAssociationShortNameHint => 'Ex: A Comparsa';
  @override
  String get onboardingAssociationSubdomain => 'Endereço web';
  @override
  String get onboardingAssociationSubdomainHint => 'Ex: lacomparsa';
  @override
  String get onboardingPrimaryColor => 'Cor primária';
  @override
  String get onboardingSecondaryColor => 'Cor secundária';
  @override
  String get onboardingBlock2Title => 'Condições gerais';
  @override
  String get onboardingBlock3Title => 'Condições para menores';
  @override
  String get onboardingAddCondition => 'Adicionar condição';
  @override
  String get onboardingConditionHint => 'Escreva a condição…';
  @override
  String get onboardingSubmit => 'Criar associação';
  @override
  String get onboardingSubdomainTaken => 'Este endereço já está em uso';
  @override
  String get onboardingSubdomainInvalid => 'Apenas letras minúsculas, números e hífens';

  // Access request

  @override
  String get accessRequestTitle => 'Solicitar acesso';
  @override
  String get accessRequestSubtitle => 'Preencha o formulário para enviar o seu pedido';
  @override
  String get accessRequestBlock1Title => 'Dados pessoais';
  @override
  String get accessRequestFullName => 'Nome completo';
  @override
  String get accessRequestBirthDate => 'Data de nascimento';
  @override
  String get accessRequestBirthDateHint => 'DD/MM/AAAA';
  @override
  String get accessRequestIdDoc => 'BI / Passaporte';
  @override
  String get accessRequestUploadIdDoc => 'Carregar foto do BI';
  @override
  String get accessRequestIdDocUploaded => 'BI carregado com sucesso';
  @override
  String get accessRequestMinorWarning => 'É menor de idade. Precisamos dos dados do seu tutor legal';
  @override
  String get accessRequestGuardianTitle => 'Dados do tutor legal';
  @override
  String get accessRequestGuardianFullName => 'Nome completo do tutor';
  @override
  String get accessRequestGuardianIdDoc => 'BI do tutor';
  @override
  String get accessRequestUploadGuardianIdDoc => 'Carregar foto do BI do tutor';
  @override
  String get accessRequestBlock2Title => 'Condições';
  @override
  String get accessRequestBlock3Title => 'Assinatura';
  @override
  String get accessRequestSignatureHint => 'Desenhe a sua assinatura no campo';
  @override
  String get accessRequestClearSignature => 'Limpar assinatura';
  @override
  String get accessRequestSubmit => 'Enviar pedido';
  @override
  String get accessRequestSubmitting => 'A enviar pedido…';

  // Pending approval

  @override
  String get pendingTitle => 'Pedido enviado';
  @override
  String get pendingSubtitle => 'O seu pedido está a ser analisado';
  @override
  String get pendingMessage => 'Um gestor da associação analisará o seu pedido e receberá uma notificação quando for aceite';

  // Rejected

  @override
  String get rejectedTitle => 'Pedido recusado';
  @override
  String get rejectedSubtitle => 'O seu pedido não foi aceite';
  @override
  String get rejectedMessage => 'Se acha que é um erro, pode enviar um novo pedido';
  @override
  String get rejectedReapply => 'Solicitar novamente';
  @override
  String get rejectedBlocked => 'Não pode voltar a solicitar acesso a esta associação';

  // Dashboard

  @override
  String get dashboardTitle => 'Início';
  @override
  String get dashboardActiveEvents => 'Eventos';
  @override
  String get dashboardNoEvents => 'Não há eventos ativos';
  @override
  String get eventDetailSessions => 'Sessões';
  @override
  String get eventDetailNoSessions => 'Não há sessões próximas';
  @override
  String get eventDetailMembers => 'Acesso';
  @override
  String get createEventTitle => 'Novo evento';
  @override
  String get createEventStartDate => 'Data de início';
  @override
  String get createEventEndDate => 'Data de fim (opcional)';
  @override
  String get createEventImageLabel => 'Imagem do evento';
  @override
  String get createEventMembersLabel => 'Membros com acesso';
  @override
  String get createEventSubmit => 'Criar evento';
  @override
  String get createCalendarEventTitle => 'Nova sessão';
  @override
  String get createCalendarEventDateLabel => 'Data da sessão';
  @override
  String get createCalendarEventSubmit => 'Criar sessão';

  // Home

  @override
  String get homeTabEvents => 'Eventos';
  @override
  String get homeTabMembers => 'Membros';
  @override
  String get homeTabAssociation => 'Associação';
  @override
  String get homeTabProfile => 'Perfil';

  // Membership status

  @override
  String get membershipStatusPendingTitle => 'Pedido enviado';
  @override
  String get membershipStatusPendingMessage => 'Um gestor analisará o seu pedido e receberá uma notificação quando for aceite';
  @override
  String get membershipStatusRejectedTitle => 'Pedido recusado';
  @override
  String get membershipStatusRejectedMessage => 'O seu pedido não foi aceite. Pode enviar um novo pedido';
  @override
  String get membershipStatusBlockedMessage => 'Não pode voltar a solicitar acesso a esta associação';
  @override
  String get membershipStatusReapply => 'Solicitar novamente';
  @override
  String get membershipStatusRefresh => 'Atualizar estado';

  // Events extras

  @override
  String get eventsActive => 'Ativos';
  @override
  String get eventsFinished => 'Terminados';
  @override
  String get eventsEmpty => 'Sem eventos';
  @override
  String get eventDetailFreeEntry => 'Entrada livre';
  @override
  String get eventDetailRequestAccess => 'Solicitar acesso';
  @override
  String get eventDetailAccessPending => 'Pedido pendente';
  @override
  String get eventDetailAccessRejected => 'Acesso negado';
  @override
  String get createEventFreeEntry => 'Entrada livre';
  @override
  String get createEventEntryCondition => 'Condição de entrada';
  @override
  String get createAppointmentTitle => 'Nova sessão';
  @override
  String get createAppointmentDateLabel => 'Data da sessão';
  @override
  String get createAppointmentSubmit => 'Criar sessão';

  // Association Detail

  @override
  String get associationDetailTitle => 'Associação';
  @override
  String get associationDetailRequirements => 'Requisitos de candidatura';
  @override
  String get associationDetailRequireIdDoc => 'Exigir documento de identidade';
  @override
  String get associationDetailRequireIdDocImage => 'Exigir imagem do documento';
  @override
  String get associationDetailRequireGuardian => 'Exigir dados do tutor';

  // Profile

  @override
  String get profileTitle => 'Perfil';
  @override
  String get profileLogout => 'Terminar sessão';
  @override
  String get profileMemberSince => 'Membro desde';

  // Onboarding extras

  @override
  String get onboardingRequireIdDoc => 'Exigir documento de identidade';
  @override
  String get onboardingRequireIdDocImage => 'Exigir imagem do documento';
  @override
  String get onboardingRequireGuardian => 'Exigir dados do tutor para menores';

  // Members

  @override
  String get membersTitle => 'Membros';
  @override
  String get membersEmpty => 'Ainda não há membros';
  @override
  String get memberStatusPending => 'Pendente';
  @override
  String get memberStatusApproved => 'Aprovado';
  @override
  String get memberStatusRejected => 'Rejeitado';
  @override
  String get memberRoleManager => 'Gestor';
  @override
  String get memberRoleMember => 'Membro';
  @override
  String get memberBlocked => 'Bloqueado';

  // Member detail

  @override
  String get memberDetailPersonalInfo => 'Informação pessoal';
  @override
  String get memberDetailEvents => 'Eventos';
  @override
  String get memberDetailNoEvents => 'Sem eventos atribuídos';
  @override
  String get memberDetailChangeRole => 'Função';
}
