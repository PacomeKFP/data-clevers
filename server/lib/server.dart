// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'routes/routes.dart';
import 'models/models.dart';
import 'controllers/controllers.dart';
import 'middlewares/middlewares.dart';

class Server {
  
  static Future<void> start() async {

    final _handler =
        Pipeline().addMiddleware(logRequests()).addHandler(MyRouter.getRouter());

    await io.serve(_handler, InternetAddress.anyIPv4, 3001).then((server) {
      server.autoCompress = true;
      print('Server running on port ${server.port}');
    });
  }
}
