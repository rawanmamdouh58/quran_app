import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataService {
  static Future<List<String>> fetchCategories() async {
    try {
      String jsonData = await rootBundle.loadString('assets/data.json');
      List<dynamic> jsonList = jsonDecode(jsonData);

      // Extract all categories from the JSON data
      Set<String> categorySet = Set<String>();
      jsonList.forEach((json) {
        if (json['category'] != null && json['category'].isNotEmpty) {
          categorySet.add(json['category']);
        }
      });

      // Convert set to list and return
      List<String> categories = categorySet.toList();
      return categories;
    } catch (e) {
      throw Exception('Failed to load categories from data.json');
    }
  }

  static Future<List<Azkar>> fetchData() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = jsonDecode(jsonData);
    return jsonList.map((e) => Azkar.fromJson(e)).toList();
  }
}

class Azkar {
  final int id;
  final String category;
  final List<AzkarItem> array;

  Azkar({required this.id, required this.category, required this.array});

  factory Azkar.fromJson(Map<String, dynamic> json) {
    return Azkar(
      id: json['id'],
      category: json['category'],
      array:
          List<AzkarItem>.from(json['array'].map((x) => AzkarItem.fromJson(x))),
    );
  }
}

class AzkarItem {
  final int id;
  final String text;
  final int count;
  const AzkarItem({required this.count, required this.id, required this.text});

  factory AzkarItem.fromJson(Map<String, dynamic> json) {
    return AzkarItem(id: json['id'], text: json['text'], count: json['count']);
  }
}
