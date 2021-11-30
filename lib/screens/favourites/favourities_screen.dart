import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavouritiesScreen extends StatelessWidget {
  final List<Meal> favMeals;
  const FavouritiesScreen({Key? key, required this.favMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text('No current favorites yet.....'),
      );
    }
    return ListView.builder(
      itemBuilder: (_, index) {
        final Meal meal = favMeals[index];
        return MealItem(
          id: meal.id,
          color: Theme.of(context).accentColor,
          title: meal.title,
          imageUrl: meal.imageUrl,
          affordability: meal.affordability,
          complexity: meal.complexity,
          duration: meal.duration,
        );
      },
      itemCount: favMeals.length,
    );
  }
}
