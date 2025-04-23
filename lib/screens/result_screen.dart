import 'package:flutter/material.dart';
import '../models/user_data.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final user = UserData(
      gender: arguments['gender'],
      age: arguments['age'],
      height: arguments['height'],
      weight: arguments['weight'],
      activity: arguments['activity'],
      goalMultiplier: arguments['goalMultiplier'],
    );

    return Scaffold(
      appBar: AppBar(title: Text('Результат')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ваша норма:', style: TextStyle(fontSize: 20)),
              SizedBox(height: 24),
              Text(
                '${user.tdee.round()} калорий в день',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Вернуться на главный экран'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
