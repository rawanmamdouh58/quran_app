import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  final List<String> content;
  final String navigateTo;

  const Topic({Key? key, required this.content, required this.navigateTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, navigateTo);
      },
      child: Container(
        height: 70,
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.brown.withOpacity(0.9),
              Colors.black.withOpacity(1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 27, 27, 27).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 6,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            content.length,
            (index) => Text(
              content[index],
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
