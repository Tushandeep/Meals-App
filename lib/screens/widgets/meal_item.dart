import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals/meal_screen.dart';
import 'package:meals_app/screens/widgets/components/sub_row_info.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.id,
    required this.color,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  final String id;
  final String title;
  final Color color;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetails.routeName,
      arguments: {
        "id": id,
        "color": color,
      },
    );
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.pricey:
        return "Pricey";
      case Affordability.luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => selectMeal(context),
        borderRadius: BorderRadius.circular(15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(imageUrl,
                        height: 250, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      width: 250,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SubRowInfo(
                        title: '$duration min', icon: Icons.schedule_outlined),
                    SubRowInfo(
                        title: complexityText, icon: Icons.work_outlined),
                    SubRowInfo(
                        title: affordabityText,
                        icon: Icons.attach_money_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
