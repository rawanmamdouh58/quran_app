import 'package:app/models/counter_provider.dart';
import 'package:app/views/hesn_almoslem.dart';
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
          'hesn_almoslem': (context) => HesnAlmoslem(),
          // 'azkark': (context) => Azkark(),
          // 'morning_azkar': (context) => Azkark(number: 0),
          // 'sleeping_azkar': (context) => Azkark(number: 1),
          // 'waking_azkar': (context) => Azkark(number: 2),
          // 'khalaa_doaa': (context) => Azkark(number: 3),
          // 'evening_azkar': (context) => EveningAzkar(),
        },
      ),
    );
  }
}
