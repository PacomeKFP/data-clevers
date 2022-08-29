library models;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../blocs/authentication/bloc/authentication_bloc.dart';
import '../blocs/sideNavigation/side_navigation_bloc.dart';
export 'user/user.model.dart';

part 'tabs/trainingTab.model.dart';
part 'sideNav/sideNavItem.model.dart';

part 'auth/auth_mode.model.dart';
part 'auth/auth_method.model.dart';
part 'auth/auth_state.model.dart';