import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String emailAddress, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return false;
  }
}

Future<bool> register(String emailAddress, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}
