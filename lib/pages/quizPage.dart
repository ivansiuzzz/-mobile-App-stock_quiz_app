import 'package:flutter/material.dart';
import 'package:quiz_stock/data/questions.dart';
import 'package:quiz_stock/pages/resultPage.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var cuurentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  final List<String> correctAnswer = [
    'A. Stocks',
    'B. GDP',
    'C. Real estate',
    'D. All the real estate an investor owns',
    'C. Real estate',
    'D. Geopolitical risk'
  ];
  final List<bool> checking = [];
  int result = 0;
  @override
  void answerQuestion(String answer) {
    if (answer == correctAnswer[cuurentQuestionIndex]) {
      checking.add(true);
    } else {
      checking.add(false);
    }

    setState(() {
      if (cuurentQuestionIndex >= questions.length - 1) {
        print(checking);
        print("zzzz");
        //cannot use map.
        checking.forEach((e) => {
              if (e == true) {result++}
            });
        print(result);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                    result: result,
                  )),
          (Route<dynamic> route) => false,
        );
      } else {
        selectedAnswers.add(answer);
        cuurentQuestionIndex++;
      }
    });
  }

  Widget build(BuildContext context) {
    final cuurentQuestion = questions[cuurentQuestionIndex];
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text("quiz"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(16.0),
                child:
                    Text(cuurentQuestion.text, style: TextStyle(fontSize: 25)),
              ),
              SizedBox(height: 50),
              ...cuurentQuestion.answers.map(
                (answer) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 30)),
                    onPressed: () {
                      answerQuestion(answer);
                    },
                    child: Text(answer),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
