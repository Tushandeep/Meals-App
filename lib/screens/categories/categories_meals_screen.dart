import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  final List<Meal> availMeals;

  const CategoriesMealsScreen({Key? key, required this.availMeals})
      : super(key: key);

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  // final String id;

  List<Meal> catMeals = [];
  String categoryTitle = '';
  late Color categoryColor;

  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      categoryTitle = routeArgs['title']!;
      final catId = routeArgs['id']!;
      categoryColor = routeArgs['color']!;
      catMeals = widget.availMeals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          final Meal meal = catMeals[index];
          return MealItem(
            id: meal.id,
            color: categoryColor,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
