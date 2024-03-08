import 'package:flutter/material.dart';

class Doaa extends StatelessWidget {
  final int counter;
  VoidCallback onTap;
  final String text;
  Doaa(
      {super.key,
      required this.counter,
      required this.onTap,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {
              onTap();
              // Add your onTap logic here
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Container(
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Text('{$counter}',
                          style: const TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
