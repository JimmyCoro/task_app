import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/presentation/providers/task_provider.dart';
import 'package:task_app/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: const MaterialApp(
        title: 'TaskApp',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
