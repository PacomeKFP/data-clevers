library models;

import 'package:aptitudes/views/home/components/components.dart';
import 'package:aptitudes/views/home/components/settings/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

export 'auth/auth.dart';

export "quiz/quiz.dart";
export "quiz/question.dart";
export "quiz/answer.dart";

export "languages/lang.dart";

import '../blocs/blocs.dart';
export 'user/user.model.dart';

part 'tabs/trainingTab.model.dart';
part 'tabs/profileTab.model.dart';
part 'sideNav/sideNavItem.model.dart';
