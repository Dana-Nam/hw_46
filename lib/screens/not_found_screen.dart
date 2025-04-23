import 'package:flutter/material.dart';
import '../app_routes.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Экран не найден')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning_amber_rounded,
                  size: 80, color: Colors.redAccent),
              SizedBox(height: 24),
              Text(
                'Такой экран не существует',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil(
                      (route) => route.settings.name == AppRoutes.welcome);
                },
                child: Text('На главный экран'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
