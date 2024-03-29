import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:job_apps/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse('https://future-jobs-api.vercel.app/categories'),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);
        parsedJson.forEach((category) {
          categories.add(CategoryModel.fromJson(category));
        });
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
