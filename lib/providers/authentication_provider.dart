import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:chat_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationProvider with ChangeNotifier {
  final _auth = firebase_auth.FirebaseAuth.instance;
  final _usersCollection = FirebaseFirestore.instance.collection('users');
  User? _user;

  User? get user => _user;

  Future<void> saveUserToFirestore(User user) async {
    await _usersCollection.doc(user.id).set(user.toMap());
  }

    Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  Future<void> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      final firebase_auth.User? firebaseUser = userCredential.user; // ここを変更
      if (firebaseUser != null) {
        _user = User(
          id: firebaseUser.uid,
          name: 'Anonymous',
          imageUrl: null,
        );
        await saveUserToFirestore(_user!);
      }
    } catch (e) {
      print('Error signing in anonymously: $e');
      throw e;
    }
  }
}
