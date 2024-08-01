import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rmdev_widgets/network/log_all_the_time_filter.dart';

class FirebaseService {
  var log = rmGetLogger("Firebase Service");
  final FirebaseAuth _auth = FirebaseAuth.instance;

 Stream<User?> userStateChanges() async* {
  yield* _auth.authStateChanges();
}

  User? isUserSignedIn() {
    try {
      if (_auth.currentUser != null) {
        return _auth.currentUser;
      }
    } on Exception catch (e) {
      log.e("Error checking if user is signed in: ${e.toString()}");
    }
    return null;
  }

  Future<FirebaseServiceResponse> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseServiceResponse(
          userInfo: userCredential.user, errorMessage: "", hasError: false);
    } on FirebaseAuthException catch (e) {
      log.e(e.message);
      return FirebaseServiceResponse(errorMessage: e.message, hasError: true);
    }
  }

  Future<void> updateDisplayName(String displayName) async {
    try {
      if (_auth.currentUser != null) {
        await _auth.currentUser?.updateDisplayName(displayName);
      }
    } on Exception catch (e) {
      log.e(e.toString());
    }
  }

  Future<FirebaseServiceResponse> sendEmailVerificationLink() async {
    try {
      if (_auth.currentUser != null) {
        await _auth.currentUser?.sendEmailVerification();
        return const FirebaseServiceResponse(errorMessage: "", hasError: false);
      }
      return const FirebaseServiceResponse(
          errorMessage: "User not signed in", hasError: true);
    } on Exception {
      return const FirebaseServiceResponse(
          errorMessage: "An error occurred", hasError: true);
    }
  }

  Future<FirebaseServiceResponse> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return FirebaseServiceResponse(
          userInfo: credential.user, errorMessage: "", hasError: false);
    } on FirebaseAuthException catch (e) {
      log.e(e.message);
      return FirebaseServiceResponse(errorMessage: e.message, hasError: true);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on Exception catch (e) {
      log.e(e.toString());
    }
  }
}

class FirebaseServiceResponse {
  final User? userInfo;
  final bool? hasError;
  final String? errorMessage;

  const FirebaseServiceResponse(
      {this.userInfo, required this.errorMessage, required this.hasError});
}
