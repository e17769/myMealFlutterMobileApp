import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'mealPlanningPage.dart';

void main() {
  runApp(MainPage());
}

//Meal Planner page
class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Gadir Feeder',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MealPlanningPage(title: 'Beast! Are you hungery yet?'),
    );
  }
}
