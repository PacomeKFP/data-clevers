part of server.controllers;

class AuthController {
  /// login handler implemented for UserName-Password login
  /// the request contain the userName fo the User who make the request
  /// It will return the mail of the user
  static Future<Response> login(Request req) async {
    int status = 400;
    Map<String, dynamic> body = {'error': 'User not found'};

    if (req.params['userName'] == null) {
      return Response.badRequest(body: {'error': 'Username not specified'});
    }

    DbCollection users = await Model.getCollection('users');
    await users
        .find({'userName': req.params['userName']})
        .toList()
        .then((user) {
          if (user.isNotEmpty && user.length == 1) {
            body['error'] = 'No error';
            body['email'] = user[0]['email'];
            status = 200;
          }
        });

    // Model.getCollection("users");
    return Response(status,
        body: json.encode(body), headers: Controller.getHeaders());
  }

  ///this handler help to add an user to the database
  static Future<Response> register(Request req) async {
    var preReg;
    if ((preReg = await preRegister(req)).statusCode != 200) {
      return preRegister(req);
    }

    int status = 400;
    Map<String, dynamic> body = {
      'error': "Error Occured when registering User in db"
    };
    try {
      DbCollection users = await Model.getCollection('users');

      await users
          .insertOne(await req.getBody())
          .then((user) => body['user'] = user.document);
    } catch (e) {
      print("An error occured when adding user in the atlas: auth.ctrl ==> $e");
      return Response.internalServerError(body: 'Error in registering');
    }

    return Response(status,
        body: json.encode(body), headers: Controller.getHeaders());
  }

  ///This function help to verify if the user nam entered by the user is in us or not
  static Future<Response> preRegister(Request req) async {
    int status = 400;
    Map<String, dynamic> body = {'error': 'User already exist'};

    if (req.params['userName'] == null) {
      return Response.badRequest(body: {'error': 'Username not specified'});
    }

    DbCollection users = await Model.getCollection('users');
    await users
        .find({'userName': req.params['userName']})
        .toList()
        .then((user) {
          body['message'] = "You can use this email to register";
          status = 201;
          if (user.isNotEmpty) {
            body['error'] = 'used username';
            body['message'] =
                "This username is already in use by another user, you can't use it to register another account ";
            status = 205;
          }
        });
    return Response(status,
        body: json.encode(body), headers: Controller.getHeaders());
  }

  static Future<Response> getEmail(Request req) async {
    int status = 400;
    Map<String, dynamic> body = {'error': 'User already exist'};

    if (req.params['userName'] == null) {
      return Response.badRequest(body: {'error': 'Username not specified'});
    }

    DbCollection users = await Model.getCollection('users');
    await users
        .find({'userName': req.params['userName']})
        .toList()
        .then((user) {
          body['message'] = "You can use this email to register";
          status = 201;
          if (user.isNotEmpty) {
            body['error'] = 'used username';
            body['message'] =
                "This username is already in use by another user, you can't use it to register another account ";
            status = 205;
          }
        });
    return Response(status,
        body: json.encode(body), headers: Controller.getHeaders());
  }
}
