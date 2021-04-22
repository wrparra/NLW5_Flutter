import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int answered;
  final int total;
  final VoidCallback onTap;
  const QuizCardWidget(
      {Key? key,
      required this.title,
      this.answered = 0,
      this.total = 0,
      required this.onTap})
      : super(key: key);

  double getProgressValue() {
    if (total > 0 && answered > 0) {
      return answered / total;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border:
                  Border.fromBorderSide(BorderSide(color: AppColors.border)),
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        child: Text(
                          title,
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
                        "$answered de $total",
                        style: AppTextStyles.body11,
                      ),
                    ),
                    Expanded(
                        child:
                            ProgressIndicatorWidget(value: getProgressValue()))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
