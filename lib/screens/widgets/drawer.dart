import 'package:flutter/material.dart';
import 'package:meals_app/screens/fliters/fliter_screen.dart';

import './components/single_list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleListTile(
            icon: Icons.restaurant_outlined,
            title: 'Meals',
            press: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SingleListTile(
            icon: Icons.settings_outlined,
            title: 'Fliters',
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(FliterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
