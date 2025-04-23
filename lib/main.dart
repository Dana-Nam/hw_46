import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'screens/welcome_screen.dart';
import 'screens/input_screen.dart';
import 'screens/activity_screen.dart';
import 'screens/goal_screen.dart';
import 'screens/result_screen.dart';
import 'screens/not_found_screen.dart';

void main() {
  runApp(CalorieApp());
}

class CalorieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent)),
      initialRoute: AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (ctx) => WelcomeScreen(),
        AppRoutes.input: (ctx) => InputScreen(),
        AppRoutes.activity: (ctx) => ActivityScreen(),
        AppRoutes.goal: (ctx) => GoalScreen(),
        AppRoutes.result: (ctx) => ResultScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => NotFoundScreen()),
    );
  }
}
