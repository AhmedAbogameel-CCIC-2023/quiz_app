import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/quiz_details/view.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(375, 812),
        );
        return child!;
      },
      title: "Quiz App",
      home: QuizDetailsView(),
    );
  }
}

