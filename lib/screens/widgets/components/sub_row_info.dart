import 'package:flutter/material.dart';

class SubRowInfo extends StatelessWidget {
  const SubRowInfo({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(icon),
        const SizedBox(width: 6),
        Text(
          title, 
          style: const TextStyle(
            fontSize: 15,
          )
        ),
      ],
    );
  }
}