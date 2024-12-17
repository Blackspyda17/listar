import 'package:flutter/material.dart';

enum TaskCategory {
  education(Icons.school, Colors.black26),
  health(Icons.favorite, Colors.black26),
  home(Icons.home, Colors.black26),
  others(Icons.calendar_month_rounded, Colors.black26),
  personal(Icons.person, Colors.black26),
  shopping(Icons.shopping_bag, Colors.black26),
  social(Icons.people, Colors.black26),
  travel(Icons.flight, Colors.black26),
  work(Icons.work, Colors.black26);

  static TaskCategory stringToTaskCategory(String name) {
    try {
      return TaskCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategory(this.icon, this.color);
}
