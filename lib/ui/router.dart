import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/home/home_screen.dart';
import 'package:flutter_playground/ui/visit_plan/screens/add_visit_data.dart';
import 'package:flutter_playground/ui/visit_plan/screens/visit_plan_screen.dart';
import '../ui/menu_screen.dart';
import 'package:go_router/go_router.dart';
import 'splash/screen/splash_screen.dart';

var router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/menu',
    builder: (context, state) => const MenuScreen(),
  ),
  GoRoute(
    path: '/home',
    name: 'Home',
    builder: (context, state) => const MyHomePage(),
  ),
  GoRoute(
    path: '/visit-plan',
    name: 'VisitPlan',
    builder: (context, state) => const VisitPlanScreen(),
  ),
  GoRoute(
    path: '/visit-data',
    name: 'VisitData',
    builder: (context, state) => const AddVisitData(),
  )
]);

Widget get errorPage => const Center(
      child: SizedBox(
        width: 200,
        child: Text('Error, maybe you forgot to include required obj'),
      ),
    );
