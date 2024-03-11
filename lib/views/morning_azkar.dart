import 'package:app/models/azkar_body_fetch.dart';
import 'package:app/models/category_title_fetch.dart';
import 'package:flutter/material.dart';

class Azkark extends StatelessWidget {
  Azkark({super.key, required this.number});
  int number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AzkarWidget(number: number),
      ),
      body: AzkarBody(
        number: number,
      ),
    );
  }
}
