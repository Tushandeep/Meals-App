import 'package:flutter/material.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/screens/meals/components/steps_to_make.dart';

import 'components/ingredients.dart';

class MealDetails extends StatelessWidget {
  static const String routeName = '/meal-details';
  final Function favHandler;
  final Function isFav;
  const MealDetails({Key? key, required this.favHandler, required this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final id = routeArgs['id'];
    final selectedMeal = mealsData.firstWhere((meal) {
      return meal.id == id;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: routeArgs['color'],
        title: FittedBox(
          child: Text(selectedMeal.title),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Ingredients.........
            IngredientsInfo(
                routeArgs: routeArgs,
                deviceWidth: deviceWidth,
                selectedMeal: selectedMeal),

            // Steps.....
            StepsInfo(
                routeArgs: routeArgs,
                deviceWidth: deviceWidth,
                selectedMeal: selectedMeal)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favHandler(selectedMeal.id),
        child: (isFav(selectedMeal.id))
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }
}
