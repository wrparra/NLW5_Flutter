import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestionNumber;
  final int totalQuestions;
  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestionNumber,
    required this.totalQuestions,
  }) : super(key: key);

  double get progressValue => (currentQuestionNumber / totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Questão $currentQuestionNumber",
                  style: AppTextStyles.body15,
                ),
                Text("de $totalQuestions"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ProgressIndicatorWidget(value: progressValue)
          ],
        ),
      ),
    );
  }
}
