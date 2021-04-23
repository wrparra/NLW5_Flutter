import 'package:DevQuiz/challenge/widgets/custom_button/custom_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
//import 'package:DevQuiz/shared/models/question_model.dart';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int total;
  final int hits;

  const ResultPage(
      {Key? key, required this.title, required this.hits, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [Image.asset(AppImages.trophy)],
                  ),
                  Column(
                    children: [
                      Text("Parabéns!", style: AppTextStyles.heading40),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 30),
                        child: Text.rich(
                          TextSpan(
                              text: "Você concluiu\n",
                              style: AppTextStyles.body,
                              children: [
                                TextSpan(
                                    text: "$title\n",
                                    style: AppTextStyles.bodyBold),
                                TextSpan(
                                  text: "com $hits de $total acertos",
                                  style: AppTextStyles.body,
                                ),
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: CustomButtonWidget.purple(
                                  label: "Compartilhar",
                                  onTap: () {
                                    Share.share(
                                        "DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\n Obtive $hits de $total acertos!");
                                  }),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: CustomButtonWidget.transparent(
                                  label: "Voltar ao início",
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ])));
  }
}
