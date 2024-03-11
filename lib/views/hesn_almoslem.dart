import 'package:app/models/category_title_fetch.dart';
import 'package:app/models/data_service.dart';
import 'package:app/views/morning_azkar.dart';
import 'package:app/widgets/zekr_type.dart';
import 'package:flutter/material.dart';

class HesnAlmoslem extends StatelessWidget {
  const HesnAlmoslem({super.key});
  // final List<String> pageRoutes = [
  //   'morning_azkar',
  //   'sleeping_azkar',
  //   'waking_azkar',
  //   'khalaa_doaa',
  // ];
  @override
  Widget build(BuildContext context) {
    // List<String> topics = [
    //   'حصن المسلم',
    //   'أذكار النوم',
    //   'أذكار الاستيقاظ',
    //   // Add more topics as needed
    // ];

    return FutureBuilder<List<String>>(
      future: DataService.fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<String> categories = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(
              title: const Text('حصن المسلم'),
            ),
            body: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ZekrType(
                  navigateTo: Azkark(number: index),
                  title: AzkarWidget(
                    number: index,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
