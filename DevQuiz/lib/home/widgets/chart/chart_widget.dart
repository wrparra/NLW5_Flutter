import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final score;
  const ChartWidget({Key? key, this.score = 0}) : super(key: key);

  int get scorePercent => (score * 100).round();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              constraints: BoxConstraints(
                maxWidth: 80,
                maxHeight: 80,
              ),
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: score,
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
              child: Text(
            "$scorePercent%",
            style: AppTextStyles.heading,
          ))
        ],
      ),
    );
  }
}
