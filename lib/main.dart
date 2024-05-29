import 'package:flutter/material.dart';
import 'package:nutri_garden_app/src/home/screens/home_screen.dart';
import 'package:nutri_garden_app/src/home/providers/meal_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // https://rapidapi.com/thecocktaildb/api/themealdb/
  runApp(const NutriGardenApp());
}

class NutriGardenApp extends StatelessWidget {
  const NutriGardenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => MealProvider(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
