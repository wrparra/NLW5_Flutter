import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(title, style: AppTextStyles.heading),
        SizedBox(
          height: 24,
        ),
        Expanded(
          child: ListView(scrollDirection: Axis.vertical, children: [
            AnswerWidget(
              title: "Kit de desenvolvimento de interface de usuário",
            ),
            AnswerWidget(
              title: "Kit de desenvolvimento de interface de usuário",
              isRight: true,
              isSelected: true,
            ),
            AnswerWidget(
              title: "Kit de desenvolvimento de interface de usuário",
              isRight: false,
              isSelected: true,
            ),
            AnswerWidget(
              title: "Kit de desenvolvimento de interface de usuário",
            )
          ]),
        ),
      ],
    ));
  }
}
