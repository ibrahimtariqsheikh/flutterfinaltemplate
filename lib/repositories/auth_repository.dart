import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_template/constants/db_constants.dart';
import 'package:final_template/models/custom_error.dart';
import 'package:final_template/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final fb_auth.FirebaseAuth firebaseAuth;

  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Stream<fb_auth.User?> get user => firebaseAuth.userChanges();

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> signUpWithEmail({
    required String firstname,
    required String lastname,
    required String gender,
    required String email,
    required String password,
  }) async {
    try {
      final fb_auth.UserCredential userCredentail =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final signedInUser = userCredentail.user!;
      User user = User(
        id: signedInUser.uid,
        firstname: firstname,
        lastname: lastname,
        gender: gender,
        username: '',
        email: email,
      );
      await usersRef.doc(signedInUser.uid).set(user.toJson());
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
