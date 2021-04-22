import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onSelect;
  const QuizWidget({Key? key, required this.question, required this.onSelect})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.question.title, style: AppTextStyles.heading),
        SizedBox(
          height: 24,
        ),
        Expanded(
          child: ListView(scrollDirection: Axis.vertical, children: [
            for (var i = 0; i < widget.question.answers.length; i++)
              AnswerWidget(
                answer: answers(i),
                disabled: indexSelected != -1,
                isSelected: indexSelected == i,
                onTap: () {
                  indexSelected = i;
                  widget.onSelect();
                  setState(() {});
                },
              ),
          ]),
        ),
      ],
    ));
  }
}
