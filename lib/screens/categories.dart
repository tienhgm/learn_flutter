import 'package:flutter/material.dart';
import 'package:flutter_internals/data/dummy_data.dart';
import 'package:flutter_internals/models/category.dart';
import 'package:flutter_internals/screens/meals.dart';
import 'package:flutter_internals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(meals: filteredMeals, title: category.title),
      ),
    ); // == Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: GridView(
          //Cross axis: trục ngang, Main axis trục dọc trong grid
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2, // tỉ lệ phần tử cross 3, main 2
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          // children: availableCategories
          //     .map((category) => CategorytGridItem(category: category))
          //     .toList()
          children: [
            for (final category in availableCategories)
              CategorytGridItem(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context, category);
                  })
          ],
        ));
  }
}
