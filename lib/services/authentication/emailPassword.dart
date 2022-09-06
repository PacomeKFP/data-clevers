part of authentication.service;

Future<UserCredential?> emailPassLogin(
    {required String email, required String password}) async {
  try {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e.message);
    return null;
  } catch (e) {
    print("Exception ${e.toString()} ");
  }
}

Future<UserCredential?> emailPassSign(
    {required String email, required String password}) async {
  try {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print("ici : ${e.stackTrace} ");
    return null;
  }
  return await emailPassLogin(email: email, password: password);
}

/// Login method in using username And Password
Future<UserCredential?> userNamePassLogin(
        {required String userName, required String password}) async =>
    await server.post(route: '/auth/login/$userName').then((res) =>
        res.statusCode == 200
            ? emailPassLogin(
                email: json.decode(res.body)['email'], password: password)
            : null);



/// befo

