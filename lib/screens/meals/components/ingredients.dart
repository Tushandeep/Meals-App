import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class IngredientsInfo extends StatelessWidget {
  const IngredientsInfo({
    Key? key,
    required this.routeArgs,
    required this.deviceWidth,
    required this.selectedMeal,
  }) : super(key: key);

  final Map<String, dynamic> routeArgs;
  final double deviceWidth;
  final Meal selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 90,
                    height: 35,
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0,),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [routeArgs['color']!.withOpacity(0.6), Colors.white,],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    child: null,
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0,),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [routeArgs['color']!.withOpacity(0.6), Colors.white,],
                      ),
                    ),
                    child: null,
                  ),
                ],
              ),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme
                  .headline6!.copyWith(
                    fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 180,
          width: deviceWidth - 30,
          decoration: BoxDecoration(
            color: routeArgs['color'].withOpacity(0.1),
            border: Border.all(color: Colors.grey,),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: routeArgs['color']!,
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("• ", style: TextStyle(color: routeArgs['color']!, fontSize: 20)),
                    Text(selectedMeal.ingredients[index]),
                  ],
                );
              },
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
        ),
      ],
    );
  }
}