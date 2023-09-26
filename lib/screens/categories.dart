import 'package:flutter/material.dart';
import 'package:flutter_internals/data/dummy_data.dart';
import 'package:flutter_internals/models/category.dart';
import 'package:flutter_internals/models/meal.dart';
import 'package:flutter_internals/screens/meals.dart';
import 'package:flutter_internals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            meals: filteredMeals,
            title: category.title,
            onToggleFavorite: onToggleFavorite),
      ),
    ); // == Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
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
        ]);
  }
}
