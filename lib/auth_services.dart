import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthServices> authservicesVaraiable = ValueNotifier(
  AuthServices(),
);

class AuthServices {
  final FirebaseAuth firebaseAuthVariable = FirebaseAuth.instance;

  User? get currentUser => firebaseAuthVariable.currentUser;

  Stream<User?> get authStateChanges => firebaseAuthVariable.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuthVariable.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuthVariable.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> singOut() async {
    await firebaseAuthVariable.signOut();
  }

  Future<void> resetPasword({required String email}) async {
    await firebaseAuthVariable.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUserName({required String userName}) async {
    await currentUser!.updateDisplayName(userName);
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuthVariable.signOut();
  }

  Future<void> resetPaswordFromCurrentPassword({
    required String email,
    required String currentpassword,
    required String newPassword,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentpassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}
