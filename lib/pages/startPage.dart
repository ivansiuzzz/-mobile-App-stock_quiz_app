import 'package:flutter/material.dart';
import 'package:quiz_stock/pages/quizPage.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/1753732.png',
          width: 300,
        ),
        Container(
          child: Text(
            'Learning stock market!',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Quiz()));
            },
            child: Text("starting amazing way"))
      ],
    ));
  }
}
