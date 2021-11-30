import 'package:flutter/material.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/screens/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/';
  
  const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: categoriesData.map((catData) {
        return CategoryItem(
          id: catData.id,
          title: catData.title, 
          color: catData.color
        );
      }).toList(),
    );
  }
}