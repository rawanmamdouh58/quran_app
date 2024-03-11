import 'package:app/models/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AzkarWidget extends StatelessWidget {
  AzkarWidget({super.key, required this.number, this.textStyle});
  final TextStyle? textStyle;
  int number;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: DataService.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else {
            if (snapshot.hasError) {
              return const Text('Error');
            } else {
              List<String> categories = snapshot.data ?? [];
              // Specify the index of the category you want to return
              int desiredIndex = number; // Change this to the desired index
              if (desiredIndex >= 0 && desiredIndex < categories.length) {
                // Check if the desired index is within the range of categories
                return Text(
                  categories[desiredIndex],
                  style: textStyle,
                );
              } else {
                // If the desired index is out of range, return an error message
                return const Text('Invalid index');
              }
            }
          }
        });
  }
}
