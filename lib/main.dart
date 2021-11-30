import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/fliters/fliter_screen.dart';
import 'package:meals_app/screens/meals/meal_screen.dart';
import 'package:meals_app/screens/categories/categories_screen.dart';
import 'package:meals_app/screens/tabs/tabs_screen.dart';
import 'screens/categories/categories_meals_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = mealsData;
  final List<Meal> _favoritedMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = mealsData.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoritedMeals.indexWhere((meal) {
      return meal.id == mealId;
    });
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(mealsData.firstWhere((meal) {
          return meal.id == mealId;
        }));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/': (_) => TabsScreen(favMeals: _favoritedMeals),
        CategoriesMealsScreen.routeName: (_) =>
            CategoriesMealsScreen(availMeals: _availableMeals),
        MealDetails.routeName: (_) => MealDetails(
              favHandler: _toggleFavorite,
              isFav: _isMealFavorite,
            ),
        FliterScreen.routeName: (_) =>
            FliterScreen(filter: _filters, filterHandler: _setFilter),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      },
      // home: const CategoriesScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensedRaleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
