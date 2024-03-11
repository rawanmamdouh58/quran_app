import 'package:flutter/material.dart';

class ZekrType extends StatelessWidget {
  final Widget title;
  final Widget navigateTo;

  ZekrType({
    super.key,
    required this.title,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      },
      child: Container(
        height: 70,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.amber.withOpacity(1),
            ],
          ),
          // color: Colors.amber,
        ),
        child: title,
      ),
    );
  }
}
