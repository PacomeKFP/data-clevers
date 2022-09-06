part of authentication.service;

Future<UserCredential> googleSignIn() async =>
    [TargetPlatform.android, TargetPlatform.iOS].contains(defaultTargetPlatform)
        ? await signInWithGoogle()
        : await signInWithGoogleWeb();

Future<UserCredential> signInWithGoogle() async {
  //Mobile & iOS
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> signInWithGoogleWeb() async {
  //Web
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({'login_hint': 'pacomekengafe@gmail.com'});
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}
