import 'package:app/models/data_service.dart';
import 'package:flutter/material.dart';

class AzkarWidget extends StatelessWidget {
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
              int desiredIndex = 0; // Change this to the desired index
              if (desiredIndex >= 0 && desiredIndex < categories.length) {
                // Check if the desired index is within the range of categories
                return Text(categories[desiredIndex]);
              } else {
                // If the desired index is out of range, return an error message
                return const Text('Invalid index');
              }
            }
          }
        });
  }
}
