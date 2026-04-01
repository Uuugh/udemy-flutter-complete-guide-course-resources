import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsDetailsScreen(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = (meals.isNotEmpty)
        ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) => MealItem(
                meal: meals[index],
                onSelectMeal: ((meal) => _selectMeal(context, meal))))
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Doh..',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                const SizedBox(
                  height: 16,
                ),
                Text('Try again',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              ],
            ),
          );
    if (title == null) return content;
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
