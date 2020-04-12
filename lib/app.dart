import 'package:flutter/material.dart';
import 'package:met_art/ui/departments_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DepartmentsList(),
      ),
    );
  }
}