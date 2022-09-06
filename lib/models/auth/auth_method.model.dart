part of authentication.model;

enum AuthMethod {
  google,
  github,
  emailPassword,
  userNamePassword;

  Future<UserCredential?> get signInWithAuthProvider async {
    try {
      return this == google ? await googleSignIn() : await signInWithGitHub();
    } on FirebaseAuthException catch (e) {
      print("ici : ${e.stackTrace} ");
      return null;
    }
  }
}
