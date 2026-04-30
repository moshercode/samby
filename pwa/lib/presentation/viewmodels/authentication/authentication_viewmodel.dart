import 'package:flutter/widgets.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:samby/presentation/utils/dialog_utils.dart';
import 'package:samby/presentation/utils/validation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class AuthenticationViewModel extends ViewModel {
  // Variables

  final Function onAuthenticated;

  String _email = '';
  String _password = '';
  String _fullName = '';
  String _phone = '';
  String _resetCode = '';
  String _newPassword = '';
  bool _isLoginMode = true;
  bool _passwordResetSent = false;
  String? _error;

  String get email => _email;
  set email(String v) {
    _email = v;
    notifyListeners();
  }

  String get password => _password;
  set password(String v) {
    _password = v;
    notifyListeners();
  }

  String get fullName => _fullName;
  set fullName(String v) {
    _fullName = v;
    notifyListeners();
  }

  String get phone => _phone;
  set phone(String v) {
    _phone = v;
    notifyListeners();
  }

  String get resetCode => _resetCode;
  set resetCode(String v) {
    _resetCode = v;
    notifyListeners();
  }

  String get newPassword => _newPassword;
  set newPassword(String v) {
    _newPassword = v;
    notifyListeners();
  }

  bool get isLoginMode => _isLoginMode;
  bool get passwordResetSent => _passwordResetSent;
  String? get error => _error;

  bool get isLoginEnabled => ValidationUtils.isValidEmail(_email.trim()) && _password.trim().length >= 6;
  bool get isRegisterEnabled =>
      _fullName.trim().isNotEmpty &&
      _phone.trim().isNotEmpty &&
      ValidationUtils.isValidEmail(_email.trim()) &&
      _password.trim().length >= 6;
  bool get isResetSubmitEnabled =>
      _resetCode.trim().length == 6 && _newPassword.trim().length >= 6;

  // Constructor

  AuthenticationViewModel({required this.onAuthenticated});

  @override
  String getScreenName() => 'authentication';

  // Public methods

  void toggleMode() {
    _isLoginMode = !_isLoginMode;
    _error = null;
    notifyListeners();
  }

  Future<void> login() async {
    if (_email.trim().isEmpty || _password.trim().isEmpty) {
      _error = Localization.of(context).authErrorInvalidData;
      notifyListeners();
      return;
    }
    setLoading(true);
    UserManager.instance.loginWithEmail(
      email: _email.trim(),
      password: _password.trim(),
      onComplete: ({AuthenticationError? error}) {
        setLoading(false);
        if (error == null) {
          onAuthenticated();
        } else {
          _error = error.getLocalizedMessage(context);
          notifyListeners();
        }
      },
    );
  }

  Future<void> register() async {
    if (_fullName.trim().isEmpty || _phone.trim().isEmpty || _email.trim().isEmpty || _password.trim().isEmpty) {
      _error = Localization.of(context).authErrorInvalidData;
      notifyListeners();
      return;
    }
    setLoading(true);
    UserManager.instance.registerWithEmail(
      name: _fullName.trim(),
      phone: _phone.trim(),
      email: _email.trim(),
      password: _password.trim(),
      onComplete: ({AuthenticationError? error}) {
        setLoading(false);
        if (error == null) {
          onAuthenticated();
        } else {
          _error = error.getLocalizedMessage(context);
          notifyListeners();
        }
      },
    );
  }

  Future<void> requestPasswordReset() async {
    if (!ValidationUtils.isValidEmail(_email.trim())) {
      _error = Localization.of(context).authErrorInvalidData;
      notifyListeners();
      return;
    }
    setLoading(true);
    UserManager.instance.requestPasswordReset(
      email: _email.trim(),
      locale: Localizations.localeOf(context).languageCode,
      onComplete: ({AuthenticationError? error}) {
        setLoading(false);
        if (error == null) {
          _passwordResetSent = true;
          notifyListeners();
        } else {
          DialogUtils.showErrorSnackBar(
            context: context,
            message: error.getLocalizedMessage(context),
          );
        }
      },
    );
  }

  Future<void> submitPasswordReset() async {
    if (_resetCode.trim().length != 6 || _newPassword.trim().isEmpty) {
      _error = Localization.of(context).authErrorInvalidData;
      notifyListeners();
      return;
    }
    setLoading(true);
    UserManager.instance.resetPassword(
      email: _email.trim(),
      token: _resetCode.trim(),
      newPassword: _newPassword.trim(),
      onComplete: ({AuthenticationError? error}) {
        setLoading(false);
        if (error == null) {
          _passwordResetSent = false;
          _error = null;
          notifyListeners();
          onAuthenticated();
        } else {
          _error = error.getLocalizedMessage(context);
          notifyListeners();
        }
      },
    );
  }

  void cancelPasswordReset() {
    _passwordResetSent = false;
    _resetCode = '';
    _newPassword = '';
    _error = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
