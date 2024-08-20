import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class TaskProvider with ChangeNotifier {
  List<Task> _taskList = [];

  List<Task> get taskList => _taskList;

  void addTask(String title, String description) {
    _taskList.add(Task(title: title, description: description));
    notifyListeners();
  }

  void removeTask(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }
}
