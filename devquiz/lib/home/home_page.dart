import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}):super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.getUser();
    homeController.getQuizzes();
    homeController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if(homeController.state == HomeState.success){
    return Scaffold(
      appBar: AppBarWidget(user: homeController.user!),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: "Fácil"),
                LevelButtonWidget(label: "Médio"),
                LevelButtonWidget(label: "Difícil"),
                LevelButtonWidget(label: "Perito"),
            ],
          ),
          SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: homeController.quizzes!.map((e) => QuizCardWidget(
                title: e.title,
                completed: "${e.questionAnswereds}/${e.questions.length}",
                percent: e.questionAnswereds/e.questions.length,
              )).toList()
            )
          )
        ]),
      )
    );
    }else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          )
        ),
      );
    }
  }
}