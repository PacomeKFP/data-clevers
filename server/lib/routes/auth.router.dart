part of server.router;

class AuthRouter {
  Router get router {
    Router auth = Router();
    Pipeline().addMiddleware(logRequests()).addHandler(auth);

    ///For userName-Password login 
    auth.post('/login/<userName>', AuthController.login);

    /// to verify if an userName is in use or not (for registering)
    auth.post('/inUse/<userName>', AuthController.preRegister);

    /// to save user data after registering with firebase
    auth.post('/register', AuthController.register);

    return auth;
  }
}
