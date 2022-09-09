library home.components;

import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aptitudes/blocs/sideNavigation/side_navigation_bloc.dart';
import 'package:aptitudes/config/colors.dart';
import 'package:aptitudes/config/app.dart';
import 'package:aptitudes/services/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:aptitudes/api/server.dart' as node;

import '../../../blocs/tabToggle/tab_toggle_bloc.dart';
import '../../../models/models.dart';


part 'navigation/navigation.dart';
part 'navigation/src/CompanyName.dart';
part 'navigation/src/navBarItem.dart';


part 'dashboard/dashboard.dart';
part 'dashboard/src/tabs.dart';
part 'dashboard/src/TrainingProgressCard.dart';
part 'dashboard/src/subHeader.dart';
part 'dashboard/src/CourseLineItem.dart';
part 'dashboard/src/header.dart';



part 'profile/profile.dart';
part 'profile/src/header.dart';
part 'profile/src/profile_tabs.view.dart';
part 'profile/src/about.dart';


