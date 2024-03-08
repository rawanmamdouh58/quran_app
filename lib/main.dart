import 'package:app/models/counter_provider.dart';
import 'package:app/views/home_view.dart';
import 'package:app/views/morning_azkar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeView(),
          'morning_azkar': (context) => Azkark(),
          // 'evening_azkar': (context) => EveningAzkar(),
        },
      ),
    );
  }
}
