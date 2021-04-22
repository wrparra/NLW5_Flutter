import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    this.isPrimary = false,
    required this.onTap,
  }) : super(key: key);

  Color get buttonBorderColor =>
      isPrimary ? AppColors.darkGreen : AppColors.border;

  Color get buttonBackgroundColor =>
      isPrimary ? AppColors.darkGreen : AppColors.white;

  Color get buttonForegroundColor =>
      isPrimary ? AppColors.white : AppColors.grey;

  TextStyle get buttonTextStyle => isPrimary
      ? AppTextStyles.buttonTextPrimary
      : AppTextStyles.buttonTextDefault;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(AppColors.grey.withOpacity(0.1)),
            backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
            foregroundColor: MaterialStateProperty.all(buttonForegroundColor),
            side:
                MaterialStateProperty.all(BorderSide(color: buttonBorderColor)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        child: Text(
          label,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
