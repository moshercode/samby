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

  bool get isLoginMode => _isLoginMode;
  bool get passwordResetSent => _passwordResetSent;
  String? get error => _error;

  bool get isLoginEnabled => ValidationUtils.isValidEmail(_email.trim()) && _password.trim().length >= 6;
  bool get isRegisterEnabled =>
      _fullName.trim().isNotEmpty &&
      ValidationUtils.isValidEmail(_email.trim()) &&
      _password.trim().length >= 6;

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
    if (_fullName.trim().isEmpty || _email.trim().isEmpty || _password.trim().isEmpty) {
      _error = Localization.of(context).authErrorInvalidData;
      notifyListeners();
      return;
    }
    setLoading(true);
    UserManager.instance.registerWithEmail(
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

  Future<void> sendPasswordReset() async {
    if (!ValidationUtils.isValidEmail(_email.trim())) {
      _error = Localization.of(context).authErrorInvalidData;
      notifyListeners();
      return;
    }
    setLoading(true);
    UserManager.instance.sendPasswordResetEmail(
      email: _email.trim(),
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

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
