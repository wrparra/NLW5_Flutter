import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallengePage({Key? key, required this.title, required this.questions})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentQuestion = pageController.page!.toInt();
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentQuestion < widget.questions.length - 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.hits++;
    }
    Future.delayed(Duration(milliseconds: 800)).then((value) => nextPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: ValueListenableBuilder<int>(
          valueListenable: controller.currentQuestionNotifier,
          builder: (context, value, _) => QuestionIndicatorWidget(
            currentQuestionNumber: value + 1,
            totalQuestions: widget.questions.length,
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentQuestionNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (value < widget.questions.length - 1)
                  Expanded(
                      child: NextButtonWidget(
                    label: "Pular",
                    onTap: () {
                      nextPage();
                    },
                  )),
                if (value == widget.questions.length - 1)
                  Expanded(
                      child: NextButtonWidget(
                          label: "Confirmar",
                          isPrimary: true,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                        title: widget.title,
                                        total: widget.questions.length,
                                        hits: controller.hits)));
                          }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
