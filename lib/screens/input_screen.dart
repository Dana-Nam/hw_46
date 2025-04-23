import 'package:flutter/material.dart';
import '../app_routes.dart';

class InputScreen extends StatefulWidget {
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String gender = 'male';
  int age = 25;
  int height = 170;
  int weight = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Базовые параметры')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: gender,
              items: [
                DropdownMenuItem(value: 'male', child: Text('Мужской')),
                DropdownMenuItem(value: 'female', child: Text('Женский')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    gender = value;
                  });
                }
              },
              decoration: InputDecoration(labelText: 'Пол'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Возраст'),
              onChanged: (value) {
                age = int.tryParse(value) ?? age;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Рост (см)'),
              onChanged: (value) {
                height = int.tryParse(value) ?? height;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Вес (кг)'),
              onChanged: (value) {
                weight = int.tryParse(value) ?? weight;
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.activity,
                  arguments: {
                    'gender': gender,
                    'age': age,
                    'height': height,
                    'weight': weight,
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
