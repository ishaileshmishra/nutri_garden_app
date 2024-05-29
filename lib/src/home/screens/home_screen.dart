import 'package:flutter/material.dart';
import 'package:nutri_garden_app/src/home/models/meal.dart';
import 'package:nutri_garden_app/src/home/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TEST')),
      body: Center(
        child: Consumer<MealProvider>(
          builder: (context, mealProvider, child) {
            if (mealProvider.loading) {
              return const CircularProgressIndicator();
            } else if (mealProvider.meals.isEmpty) {
              return ElevatedButton(
                onPressed: () {
                  mealProvider.fetchMealCategories();
                },
                child: const Text('Fetch Meals'),
              );
            } else {
              return ListView.builder(
                itemCount: mealProvider.meals.length,
                itemBuilder: (context, index) {
                  Meal meal = mealProvider.meals[index];
                  return ListTile(
                    leading: Image.network(meal.strMealThumb),
                    title: Text(meal.strMeal),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
