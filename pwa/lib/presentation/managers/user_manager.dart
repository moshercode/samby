import 'package:samby/core/utils/log.dart';
import 'package:samby/presentation/resources/l10n/localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthenticationError {
  missingRequiredFields,
  emailAlreadyInUse,
  invalidCredentials,
  weakPassword,
  tooManyAttempts,
  unknown;

  String getLocalizedMessage(BuildContext context) {
    final Localization l = Localization.of(context);
    switch (this) {
      case AuthenticationError.missingRequiredFields:
        return l.authErrorInvalidData;
      case AuthenticationError.emailAlreadyInUse:
        return l.authErrorEmailInUse;
      case AuthenticationError.invalidCredentials:
        return l.authErrorInvalidCredentials;
      case AuthenticationError.weakPassword:
        return l.authErrorWeakPassword;
      case AuthenticationError.tooManyAttempts:
        return l.authErrorTooManyAttempts;
      case AuthenticationError.unknown:
        return l.errorGeneric;
    }
  }

  factory AuthenticationError.fromFirebaseCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return AuthenticationError.emailAlreadyInUse;
      case 'wrong-password':
      case 'user-not-found':
      case 'invalid-credential':
        return AuthenticationError.invalidCredentials;
      case 'weak-password':
        return AuthenticationError.weakPassword;
      case 'too-many-requests':
        return AuthenticationError.tooManyAttempts;
      default:
        return AuthenticationError.unknown;
    }
  }
}

final class UserManager {
  // Variables

  static UserManager? _instance;
  static UserManager get instance => _instance ??= UserManager._();
  late FirebaseAuth _auth;
  User? get user => FirebaseAuth.instance.currentUser;
  bool get isAuthenticated => user?.uid != null;
  String? get userEmail => user?.email;

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
    Log.debug('UserManager.loginWithEmail…');
    AuthenticationError? error;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Log.error('UserManager.loginWithEmail error: $e');
      error = AuthenticationError.fromFirebaseCode(e.code);
    } catch (e) {
      Log.error('UserManager.loginWithEmail unknown: $e');
      error = AuthenticationError.unknown;
    } finally {
      onComplete(error: error);
    }
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
    required Function({AuthenticationError? error}) onComplete,
  }) async {
    Log.debug('UserManager.registerWithEmail…');
    AuthenticationError? error;
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Log.error('UserManager.registerWithEmail error: $e');
      error = AuthenticationError.fromFirebaseCode(e.code);
    } catch (e) {
      Log.error('UserManager.registerWithEmail unknown: $e');
      error = AuthenticationError.unknown;
    } finally {
      onComplete(error: error);
    }
  }

  Future<void> sendPasswordResetEmail({
    required String email,
    required Function({AuthenticationError? error}) onComplete,
  }) async {
    Log.debug('UserManager.sendPasswordResetEmail…');
    AuthenticationError? error;
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Log.error('UserManager.sendPasswordResetEmail error: $e');
      error = AuthenticationError.fromFirebaseCode(e.code);
    } catch (e) {
      Log.error('UserManager.sendPasswordResetEmail unknown: $e');
      error = AuthenticationError.unknown;
    } finally {
      onComplete(error: error);
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    SessionDataManagerRef.clearSession();
  }
}

// Avoids a circular import: user_manager ↔ session_data_manager
abstract class SessionDataManagerRef {
  static void Function() clearSession = () {};
}
