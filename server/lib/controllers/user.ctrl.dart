part of server.controllers;

class UserController {
  static Future<Response> allUser(Request req) async{
    
    return Response.ok(json.encode({}));
  }
}
