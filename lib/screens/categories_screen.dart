import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(20),
          children: DUMMY_CATEGORIES
              .map((data) => CategoryItem(
                    data.id,
                    data.title,
                    data.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20));
  }
}
