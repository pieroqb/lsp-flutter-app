import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final googleSignIn = GoogleSignIn();
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //Future<bool> get googleSignIn => _googleSignIn.isSignedIn();

  Future login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
       Fluttertoast.showToast(
       msg: "Usuario y/o contraseña incorrectos",
       toastLength: Toast.LENGTH_SHORT,
       backgroundColor: Colors.red[100],
       textColor: Colors.black,
       fontSize: 16.0
       );
      return e.message;
    }
  }
  Future googleLogin() async {
    await googleSignIn.signOut();
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return null;
    //_user = googleUser; 

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    await _firebaseAuth.signInWithCredential(credential);

    //notifyListeners();
  }
  Future signup(String email, String password) async {
    await signOut();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
       Fluttertoast.showToast(
       msg: "El correo ingresado no es válido",
       toastLength: Toast.LENGTH_SHORT,
       backgroundColor: Colors.red[100],
       textColor: Colors.black,
       fontSize: 16.0
       );
      return e.message;
    }
  }
  Future signOut() async {
    await _firebaseAuth.signOut();
  }
  String? getCurrentUser() {
    return _firebaseAuth.currentUser?.uid;
  }
}