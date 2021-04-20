import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      child: Image.asset(AppImages.blocks)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Gerenciamento de Estado",
                        style: AppTextStyles.body15,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Text(
                      "3 de 10",
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(child: ProgressIndicatorWidget(value: 0.3))
                ],
              )
            ],
          ),
        ));
  }
}
