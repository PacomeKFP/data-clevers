// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

/// Using a dart server api, we can't acces to sessions like in PHP or like with Node,
/// Then, we will just use non authenticates requests to the api
/// the [Server] class will be help full to configure our HTTPClient
/// We just have to set the base url for the API, the Headers of our requests
/// The we also have to ~@overrides~ [get], [post], [delete] and [put] methods of http
/// We override the by making it requiring shorts routes,
///  and we add to them the header previously configurated

String get baseUrl => "https://form.dataclevers.com";
Map<String, String> get _headers => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*",
    };

///Our new [get] method
Future<http.Response> get({required String route}) async =>
    await http.get(Uri.parse(baseUrl + route), headers: _headers);

///Our new [post] method
Future<http.Response> post(
        {required String route, Map<String, dynamic> data = const {}}) async =>
    await http.post(Uri.parse(baseUrl + route),
        body: json.encode(data), headers: _headers);

///Our new [put] method
Future<http.Response> put(
        {required String route, Map<String, dynamic> data = const {}}) async =>
    await http.put(Uri.parse(baseUrl + route),
        body: json.encode(data), headers: _headers);

///Our new [delete] method
Future<http.Response> delete(
        {required String route, Map<String, dynamic> data = const {}}) async =>
    await http.delete(Uri.parse(baseUrl + route),
        body: json.encode(data), headers: _headers);
