// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAlreadyLogged() {
    var user = _auth.currentUser;
    print("user: ${user!.displayName}");
    return user != null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebase() async {
    await _auth.signOut();
  }

  // Anonimo
  Future<void> anonymousSignIn() async {
    final anonymousUser = (await _auth.signInAnonymously()).user;
    await anonymousUser!.updateDisplayName(
      "${anonymousUser.uid.substring(0, 5)}_invitado",
    );
    await anonymousUser.reload();
  }

  Future<void> signInWithGoogle() async {
    //Google sign in
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    print("User: ${googleUser.displayName}");
    print("User: ${googleUser.email}");
    print("User: ${googleUser.photoUrl}");

    // Credenciales para firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Firebase sign in
    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
    final firebaseToken = await user.getIdToken();
    assert(!user.isAnonymous);
    assert(firebaseToken != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);

    print("Firebase Token: $firebaseToken");
  }
}
