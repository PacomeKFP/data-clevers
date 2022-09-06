part of authentication.service;

Future<UserCredential> signInWithGitHub() async {
  //web
  // Create a new provider
  GithubAuthProvider githubProvider = GithubAuthProvider();

  // Once signed in, return the UserCredential
  return [TargetPlatform.iOS, TargetPlatform.android]
          .contains(defaultTargetPlatform)
      ? await _auth.signInWithAuthProvider(githubProvider)
      : await FirebaseAuth.instance.signInWithPopup(githubProvider);
}