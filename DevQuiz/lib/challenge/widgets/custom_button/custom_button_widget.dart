import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final VoidCallback onTap;

  const CustomButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  CustomButtonWidget.transparent({
    required String label,
    required VoidCallback onTap,
  })   : this.label = label,
        this.backgroundColor = Colors.transparent,
        this.foregroundColor = AppColors.grey,
        this.borderColor = Colors.transparent,
        this.onTap = onTap;

  CustomButtonWidget.white({
    required String label,
    required VoidCallback onTap,
  })   : this.label = label,
        this.backgroundColor = AppColors.white,
        this.foregroundColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  CustomButtonWidget.purple({
    required String label,
    required VoidCallback onTap,
  })   : this.label = label,
        this.backgroundColor = AppColors.purple,
        this.foregroundColor = AppColors.white,
        this.borderColor = AppColors.purple,
        this.onTap = onTap;

  CustomButtonWidget.green({
    required String label,
    required VoidCallback onTap,
  })   : this.label = label,
        this.backgroundColor = AppColors.darkGreen,
        this.foregroundColor = AppColors.white,
        this.borderColor = AppColors.darkGreen,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(AppColors.grey.withOpacity(0.1)),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(foregroundColor),
            side: MaterialStateProperty.all(BorderSide(color: borderColor)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              color: foregroundColor,
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
