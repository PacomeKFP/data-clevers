library server.router;

import 'dart:io';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:server/controllers/controllers.dart';

part "auth.router.dart";

class MyRouter {
  static Router getRouter() {
    final router = Router();

    router.mount('/auth', AuthRouter().router);
    router.get('/test', (Request req) {
      return Response.ok(json.encode({"message": "Yo the KFP test"}));
    });
    return router;
  }
}
