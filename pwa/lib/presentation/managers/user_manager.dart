import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';

enum AuthenticationError {
  missingRequiredFields,
  emailAlreadyInUse,
  invalidCredentials,
  resetTokenInvalid,
  resetTokenExpired,
  resetTokenUsed,
  tooManyAttempts,
  unknown;

  String getLocalizedMessage(BuildContext context) {
    switch (this) {
      case AuthenticationError.missingRequiredFields:
        return Localization.of(context).authErrorInvalidData;
      case AuthenticationError.emailAlreadyInUse:
        return Localization.of(context).authErrorEmailInUse;
      case AuthenticationError.invalidCredentials:
        return Localization.of(context).authErrorInvalidCredentials;
      case AuthenticationError.resetTokenInvalid:
        return Localization.of(context).authErrorResetTokenInvalid;
      case AuthenticationError.resetTokenExpired:
        return Localization.of(context).authErrorResetTokenExpired;
      case AuthenticationError.resetTokenUsed:
        return Localization.of(context).authErrorResetTokenUsed;
      case AuthenticationError.tooManyAttempts:
        return Localization.of(context).authErrorTooManyAttempts;
      case AuthenticationError.unknown:
        return Localization.of(context).errorGeneric;
    }
  }

  factory AuthenticationError.fromCode(String code) {
    switch (code) {
      case 'invalid-argument':
        return AuthenticationError.missingRequiredFields;
      case 'already-exists':
        return AuthenticationError.emailAlreadyInUse;
      case 'unauthenticated':
        return AuthenticationError.invalidCredentials;
      case 'not-found':
        return AuthenticationError.resetTokenInvalid;
      case 'deadline-exceeded':
        return AuthenticationError.resetTokenExpired;
      case 'failed-precondition':
        return AuthenticationError.resetTokenUsed;
      case 'resource-exhausted':
        return AuthenticationError.tooManyAttempts;
      default:
        return AuthenticationError.unknown;
    }
  }
}

final class UserManager {
  // Constants

  static const String kUserManagerStoredUser = 'user-manager-user';
  static const String kUserManagerStoredPassword = 'user-manager-password';

  // Variables

  static UserManager? _instance;
  static UserManager get instance => _instance ??= UserManager._();
  late FirebaseAuth _auth;
  User? get user => FirebaseAuth.instance.currentUser;
  String? get userEmail => user?.email ?? SessionDataManager.instance.member?.email;
  bool get isAuthenticated => user?.uid != null;

  // Constructor

  UserManager._();

  // Public methods

  Future<void> init() async {
    _auth = FirebaseAuth.instance;
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required Function({AuthenticationError? error}) onComplete,
  }) async {
    Log.debug('UserManager.loginWithEmail...');
    final String? associationId = SessionDataManager.instance.association?.id;
    if (associationId == null) {
      onComplete(error: AuthenticationError.unknown);
      return;
    }

    AuthenticationError? error;
    try {
      final HttpsCallableResult<dynamic> result = await FirebaseFunctions.instanceFor(
        region: 'europe-southwest1',
      ).httpsCallable('memberLogin').call(<String, String>{
        'email': email,
        'password': password,
        'associationId': associationId,
      });
      final String token = result.data['token'] as String;
      await FirebaseAuth.instance.signInWithCustomToken(token);
    } on FirebaseFunctionsException catch (e) {
      Log.error('UserManager.loginWithEmail error: $e');
      error = AuthenticationError.fromCode(e.code);
    } catch (_) {
      Log.error('UserManager.loginWithEmail unknown error');
      error = AuthenticationError.unknown;
    } finally {
      Log.debug('UserManager.loginWithEmail finished');
      onComplete(error: error);
    }
  }

  Future<void> registerWithEmail({
    required String name,
    required String phone,
    required String email,
    required String password,
    required Function({AuthenticationError? error}) onComplete,
  }) async {
    Log.debug('UserManager.registerWithEmail...');
    final String? associationId = SessionDataManager.instance.association?.id;
    if (associationId == null) {
      onComplete(error: AuthenticationError.unknown);
      return;
    }

    AuthenticationError? error;
    try {
      final HttpsCallableResult<dynamic> result = await FirebaseFunctions.instanceFor(
        region: 'europe-southwest1',
      ).httpsCallable('memberRegister').call(<String, String>{
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'associationId': associationId,
      });
      final String token = result.data['token'] as String;
      await FirebaseAuth.instance.signInWithCustomToken(token);
    } on FirebaseFunctionsException catch (e) {
      Log.error('UserManager.registerWithEmail error: $e');
      error = AuthenticationError.fromCode(e.code);
    } catch (e) {
      Log.error('UserManager.registerWithEmail unknown error: $e');
      error = AuthenticationError.unknown;
    } finally {
      Log.debug('UserManager.registerWithEmail finished');
      onComplete(error: error);
    }
  }

  Future<void> requestPasswordReset({
    required String email,
    required String locale,
    required Function({AuthenticationError? error}) onComplete,
  }) async {
    Log.debug('UserManager.requestPasswordReset...');
    final String? associationId = SessionDataManager.instance.association?.id;
    if (associationId == null) {
      onComplete(error: AuthenticationError.unknown);
      return;
    }

    AuthenticationError? error;
    try {
      await FirebaseFunctions.instanceFor(
        region: 'europe-southwest1',
      ).httpsCallable('memberRequestPasswordReset').call(<String, String>{
        'email': email,
        'associationId': associationId,
        'locale': locale,
      });
    } on FirebaseFunctionsException catch (e) {
      Log.error('UserManager.requestPasswordReset error: $e');
      error = AuthenticationError.fromCode(e.code);
    } catch (e) {
      Log.error('UserManager.requestPasswordReset unknown error: $e');
      error = AuthenticationError.unknown;
    } finally {
      Log.debug('UserManager.requestPasswordReset finished');
      onComplete(error: error);
    }
  }

  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
    required Function({AuthenticationError? error}) onComplete,
  }) async {
    Log.debug('UserManager.resetPassword...');
    final String? associationId = SessionDataManager.instance.association?.id;
    if (associationId == null) {
      onComplete(error: AuthenticationError.unknown);
      return;
    }

    AuthenticationError? error;
    try {
      await FirebaseFunctions.instanceFor(
        region: 'europe-southwest1',
      ).httpsCallable('memberResetPassword').call(<String, String>{
        'email': email,
        'associationId': associationId,
        'token': token,
        'newPassword': newPassword,
      });
    } on FirebaseFunctionsException catch (e) {
      Log.error('UserManager.resetPassword error: $e');
      error = AuthenticationError.fromCode(e.code);
    } catch (e) {
      Log.error('UserManager.resetPassword unknown error: $e');
      error = AuthenticationError.unknown;
    } finally {
      Log.debug('UserManager.resetPassword finished');
      onComplete(error: error);
    }
  }

  Future<void> logOut() async {
    SessionDataManager.instance.clearMember();
    await _auth.signOut();
  }

  Future<void> reloadUser() async {
    await _auth.currentUser?.reload();
  }
}
