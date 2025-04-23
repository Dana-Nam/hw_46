import 'package:flutter/material.dart';
import '../app_routes.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  double selectedActivity = 1.2;

  final List<Map<String, dynamic>> activityLevels = [
    {'label': 'Сидячий образ жизни', 'value': 1.2},
    {'label': 'Умеренная активность (1-3 тренировки в неделю)', 'value': 1.375},
    {'label': 'Средняя активность (3-5 тренировок в неделю)', 'value': 1.55},
    {'label': 'Высокая активность (6-7 тренировок в неделю)', 'value': 1.725},
    {'label': 'Очень высокая активность (профспорт)', 'value': 1.9},
  ];

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final gender = arguments['gender'];
    final age = arguments['age'];
    final height = arguments['height'];
    final weight = arguments['weight'];

    return Scaffold(
      appBar: AppBar(title: Text('Уровень активности')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            DropdownButtonFormField<double>(
              value: selectedActivity,
              items: activityLevels.map<DropdownMenuItem<double>>((e) {
                return DropdownMenuItem<double>(
                  value: e['value'],
                  child: Text(e['label']),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedActivity = value;
                  });
                }
              },
              decoration:
                  InputDecoration(labelText: 'Выберите уровень активности'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.goal,
                  arguments: {
                    'gender': gender,
                    'age': age,
                    'height': height,
                    'weight': weight,
                    'activity': selectedActivity,
                  },
                );
              },
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}
