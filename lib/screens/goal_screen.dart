import 'package:flutter/material.dart';
import '../app_routes.dart';

class GoalScreen extends StatefulWidget {
  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  double selectedMultiplier = 1.0;

  final List<Map<String, dynamic>> goals = [
    {'label': 'Удержание веса', 'value': 1.0},
    {'label': 'Дефицит калорий (умеренный)', 'value': 0.85},
    {'label': 'Профицит калорий (умеренный)', 'value': 1.15},
  ];

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final gender = arguments['gender'];
    final age = arguments['age'];
    final height = arguments['height'];
    final weight = arguments['weight'];
    final activity = arguments['activity'];

    return Scaffold(
      appBar: AppBar(title: Text('Цель')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            DropdownButtonFormField<double>(
              value: selectedMultiplier,
              decoration: InputDecoration(labelText: 'Выберите цель'),
              items: goals.map<DropdownMenuItem<double>>((e) {
                return DropdownMenuItem<double>(
                  value: e['value'],
                  child: Text(e['label']),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedMultiplier = value;
                  });
                }
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.result,
                  arguments: {
                    'gender': gender,
                    'age': age,
                    'height': height,
                    'weight': weight,
                    'activity': activity,
                    'goalMultiplier': selectedMultiplier,
                  },
                );
              },
              child: Text('Показать результат'),
            ),
          ],
        ),
      ),
    );
  }
}
