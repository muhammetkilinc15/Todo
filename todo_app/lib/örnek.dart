import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<String> todo = ["FLutter", "Instagram", "Youtube","Kral","Mami",];

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: ListView.builder(
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(todo[index]),
                  );
                },
      ))),
    );
  }
}
