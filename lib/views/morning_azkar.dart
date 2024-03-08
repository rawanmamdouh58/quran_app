import 'package:app/models/azkar_body_fetch.dart';
import 'package:app/models/category_title_fetch.dart';
import 'package:flutter/material.dart';

class Azkark extends StatefulWidget {
  @override
  State<Azkark> createState() => _MorningAzkarState();
}

class _MorningAzkarState extends State<Azkark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AzkarWidget(),
      ),
      // body:
      body: const AzkarBody(),
    );
  }
}
