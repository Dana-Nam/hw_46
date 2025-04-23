import 'package:flutter/material.dart';
import 'screens/input_screen.dart';
import 'screens/activity_screen.dart';
import 'screens/goal_screen.dart';
import 'screens/result_screen.dart';
import 'app_routes.dart';

void main() {
  runApp(CalorieApp());
}

class CalorieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: AppRoutes.input,
      routes: {
        AppRoutes.input: (ctx) => InputScreen(),
        AppRoutes.activity: (ctx) => ActivityScreen(),
        AppRoutes.goal: (ctx) => GoalScreen(),
        AppRoutes.result: (ctx) => ResultScreen(),
      },
    );
  }
}
