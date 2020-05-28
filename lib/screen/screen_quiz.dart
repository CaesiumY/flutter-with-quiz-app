import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/model_quiz.dart';
import 'package:flutter_quiz/widget/widget_cadidate.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizs;
  QuizScreen({this.quizs});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [
    false,
    false,
    false,
    false,
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple),
            ),
            width: width * 0.85,
            height: height * 0.5,
            child: Swiper(
              physics: NeverScrollableScrollPhysics(),
              loop: false,
              itemCount: widget.quizs.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildQuizCard(widget.quizs[index], width, height);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(Quiz quiz, width, height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
            child: Text(
              'Q' + (_currentIndex + 1).toString() + '.',
              style: TextStyle(
                  fontSize: width * 0.06, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top: width * 0.012),
            child: AutoSizeText(
              quiz.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  fontSize: width * 0.048, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: _buildCandidates(width, quiz),
          )
        ],
      ),
    );
  }

  List<Widget> _buildCandidates(double width, Quiz quiz) {
    List<Widget> _children = [];

    for (int i = 0; i < 4; i++) {
      _children.add(CandWidget(
        index: i,
        text: quiz.candidates[i],
        width: width,
        answerState: _answerState[i],
        tap: () {
          setState(() {
            for (int j = 0; j < 4; j++) {
              if (i == j) {
                _answerState[j] = true;
                _answers[_currentIndex] = j;
              } else {
                _answerState[j] = false;
              }
              // 선택지 터치 시, 하나만 true로 바꾸고 나머지는 false로 바꾸는 일종의 라디오 버튼
            }
          });
        },
      ));
      _children.add(Padding(
        padding: EdgeInsets.all(width * 0.024),
      ));
    }
    return _children;
  }
}
