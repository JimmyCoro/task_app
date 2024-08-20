import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/presentation/providers/task_provider.dart';

void showAddTaskDialog(BuildContext context) {
  String title = '';
  String description = '';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Agregar Nueva Tarea'),
        content: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Título'),
              onChanged: (value) {
                title = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Descripción'),
              onChanged: (value) {
                description = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              if (title.isNotEmpty && description.isNotEmpty) {
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(title, description);
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}
