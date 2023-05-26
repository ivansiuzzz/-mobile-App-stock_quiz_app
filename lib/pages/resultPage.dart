import 'package:flutter/material.dart';
import 'package:quiz_stock/main.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.result});

  final int result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("YOUR SCORE"), backgroundColor: Colors.blue),
        body: Center(
            child: Column(
          children: [
            SizedBox(height: 200),
            Text("Total Correct  $result answer",
                style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text("Answer one more time")),
          ],
        )));
  }
}
