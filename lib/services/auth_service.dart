import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  User? get currentUser => _auth.currentUser;

  Future<User?> signUp(String email, String password, String displayName) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await cred.user!.updateDisplayName(displayName);
    await cred.user!.sendEmailVerification();
    await usersCollection.doc(cred.user!.uid).set({
      'email': email,
      'displayName': displayName,
      'uid': cred.user!.uid,
      'notifications': true,
    });
    return cred.user;
  }

  Future<User?> signIn(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    if (!cred.user!.emailVerified) throw Exception('Email not verified');
    return cred.user;
  }

  Future<void> signOut() async => await _auth.signOut();

  Future<void> toggleNotifications(bool enabled) async {
    if (currentUser != null) {
      await usersCollection.doc(currentUser!.uid).update({'notifications': enabled});
    }
  }

  Future<DocumentSnapshot> getUserProfile() async {
    return await usersCollection.doc(currentUser!.uid).get();
  }
}