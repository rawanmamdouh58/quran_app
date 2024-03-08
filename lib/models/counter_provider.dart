// import 'dart:js_util';

import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void decrement() {
    counter--;
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:vibration/vibration.dart'; // Import the vibration package

// class CounterProvider with ChangeNotifier {
//   int counter = 100;

//   Future<void> decrement() async {
//     counter--;
//     notifyListeners();
//     if (await Vibration.hasVibrator()) {
//       // Check if the device has a vibrator
//       Vibration.vibrate(duration: 100); // Vibrate for 100 milliseconds
//     }
//   }
// }
