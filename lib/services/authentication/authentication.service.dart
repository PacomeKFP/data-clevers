library authentication.service;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../api/server.dart' as server;

part 'github.dart';
part 'google.dart';
part 'emailPassword.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signOut() async => await _auth.signOut();
