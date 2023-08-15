import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app_g1/core/app_colors/app_colors.dart';
import 'package:quiz_app_g1/core/route_utils/route_utils.dart';
import 'package:quiz_app_g1/views/quiz_details/view.dart';
import 'package:quiz_app_g1/widgets/app_app_bar.dart';
import 'package:quiz_app_g1/widgets/app_button.dart';
import 'package:quiz_app_g1/widgets/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizResultView extends StatefulWidget {
  const QuizResultView({
    super.key,
    required this.score,
    required this.total,
  });

  final int score;
  final int total;

  @override
  State<QuizResultView> createState() => _QuizResultViewState();
}

class _QuizResultViewState extends State<QuizResultView> {

  late SharedPreferences prefs;
  int? lastScore, highScore;

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    getScore();
    cacheScore();
  }

  void cacheScore() {
    prefs.setInt('last_score', widget.score);
    final highScore = prefs.getInt('high_score');
    if (highScore == null || widget.score > highScore) {
      prefs.setInt('high_score', widget.score);
    }
    this.highScore = prefs.getInt('high_score');
    setState(() {});
  }

  void getScore() {
    lastScore = prefs.getInt('last_score');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Result"),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppText(
                title: 'Quiz Finished',
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: 'Score is ${widget.score}/${widget.total}',
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: AppColors.purple,
                    ),
                    SizedBox(height: 12),
                    if (lastScore != null)
                    AppText(
                      title: 'Last Score $lastScore',
                      fontSize: 18,
                      color: AppColors.darkGray,
                    ),
                    SizedBox(height: 12),
                    if (highScore != null)
                      AppText(
                        title: 'High Score $highScore',
                        fontSize: 18,
                        color: AppColors.darkGray,
                      ),
                  ],
                ),
              ),
              AppButton(
                title: 'Retry',
                onTap: () {
                  RouteUtils.pushAndPopAll(
                    context: context,
                    view: QuizDetailsView(),
                  );
                },
                color: AppColors.yellow,
              ),
              SizedBox(height: 12),
              AppButton(
                title: 'Exit',
                color: AppColors.gray,
                onTap: () => exit(0),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
