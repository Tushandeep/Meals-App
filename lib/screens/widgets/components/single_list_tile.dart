import 'package:flutter/material.dart';

class SingleListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() press;
  const SingleListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: press,
    );
  }
}
