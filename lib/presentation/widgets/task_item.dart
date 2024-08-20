import 'package:flutter/material.dart';
import 'package:task_app/presentation/providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onRemove;

  const TaskItem({required this.task, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: const Color(0xFF349695),
      child: ListTile(
        tileColor: const Color(0xFF349695),
        title: Text(
          task.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          task.description,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.white),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
