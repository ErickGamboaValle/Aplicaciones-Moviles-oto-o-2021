import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isAlreadyLogged() {
    var user = _auth.currentUser;
    print("User: ${user!.displayName}");
    return user != null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebase() async {
    await _auth.signOut();
  }

  Future<void> anonimousUser() async {
    final anonimousUser = (await _auth.signInAnonymously()).user;
    await anonimousUser!
        .updateDisplayName("${anonimousUser.uid.substring(0, 5)} _invitado");
    await anonimousUser.reload();
  }

  Future<void> signInWithGoogle() async {
    //google sign in
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    print("User: ${googleUser.displayName}");
    print("User: ${googleUser.email}");
    print("User: ${googleUser.photoUrl}");

    //credenciales para firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //firebase signin
    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
    final firebasetoken = await user.getIdToken();
    assert(!user.isAnonymous);
    assert(firebasetoken != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);

    print("Firebase token: ${firebasetoken}");
  }
}
