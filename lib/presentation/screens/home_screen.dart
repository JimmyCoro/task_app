import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/presentation/providers/task_provider.dart';
import 'package:task_app/presentation/widgets/add_task.dart';
import 'package:task_app/presentation/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logo_app.png',
              height: 60,
            ),
            const SizedBox(width: 10),
            const Text('Lista de Tareas'),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.taskList.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.taskList[index];
                  return TaskItem(
                    task: task,
                    onRemove: () {
                      taskProvider.removeTask(index);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF349695), // Cambia el color de fondo aquí
        child: Icon(
          Icons.add,
          color: Colors.white, // Cambia el color del ícono aquí
          size: 24,
        ),
        onPressed: () {
          showAddTaskDialog(context);
        },
      ),
    );
  }
}
