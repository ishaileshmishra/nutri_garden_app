import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nutri_garden_app/src/home/models/meal.dart';
import 'package:nutri_garden_app/src/home/models/meal_category.dart';

const baseURL = 'https://themealdb.p.rapidapi.com';
const listAllCategories = '$baseURL/list.php';
const listAllIngredients = '$baseURL/list.php?i=list';
const listAllAreas = '$baseURL/list.php?a=list';
const listLatestMeals = '$baseURL/latest.php';
const listAllMeals = '$baseURL/categories.php';

const defaultHeaders = {
  // replace-your-header
  'X-RapidAPI-Key': '5fe0bcc9bbmsh24e1860b1a4f8c8p101ebfjsn747e9173c2dd',
  'X-RapidAPI-Host': 'themealdb.p.rapidapi.com'
};

class MealProvider with ChangeNotifier {
  List<Meal> _meals = [];
  List<MealCategory> _mealCategory = [];
  bool _loading = false;

  List<MealCategory> get categories => _mealCategory;
  List<Meal> get meals => _meals;
  bool get loading => _loading;

  Future<void> fetchMealCategories() async {
    _loading = true;
    notifyListeners();
    //final uri = Uri.https("https://themealdb.p.rapidapi.com/list.php");
    final uri = Uri.https('themealdb.p.rapidapi.com', '/list.php');
    final response = await http.get(uri, headers: defaultHeaders);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _mealCategory = (data['meals'] as List)
          .map((mealJson) => MealCategory.fromJson(mealJson))
          .toList();
    } else {
      const Center(child: Text('Failed to load meals'));
      //throw Exception('Failed to load meals');
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> fetchAllIngredients() async {
    _loading = true;
    notifyListeners();
    final uri = Uri.https(listAllCategories);
    final response = await http.get(uri, headers: defaultHeaders);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _meals = (data['meals'] as List)
          .map((mealJson) => Meal.fromJson(mealJson))
          .toList();
    } else {
      throw Exception('Failed to load meals');
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> fetchAllAreas() async {
    _loading = true;
    notifyListeners();
    final uri = Uri.https(listAllAreas);
    final response = await http.get(uri, headers: defaultHeaders);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _meals = (data['meals'] as List)
          .map((mealJson) => Meal.fromJson(mealJson))
          .toList();
    } else {
      throw Exception('Failed to load meals');
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> fetchAllMeals() async {
    _loading = true;
    notifyListeners();
    final uri = Uri.https(listLatestMeals);
    final response = await http.get(uri, headers: defaultHeaders);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _meals = (data['meals'] as List)
          .map((mealJson) => Meal.fromJson(mealJson))
          .toList();
    } else {
      throw Exception('Failed to load meals');
    }
    _loading = false;
    notifyListeners();
  }
}
