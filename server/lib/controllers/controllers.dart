library server.controllers;

import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:server/models/models.dart';
import 'package:server/server.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// import '../configs/headers.dart';

part 'auth.ctrl.dart';
part 'user.ctrl.dart';

extension on Request {
  Future<Map<String, dynamic>> getBody() async =>
      await readAsString().then((body) => json.decode(body));
}

class Controller {
  static Map<String, Object> getHeaders({String method = "GET"}) => {
        'Content-Type': 'application/json; charset=utf-8',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': '*',
        'Server': 'The KFP Dart server',
        'Date': DateTime.now().toString(),
      };
}
