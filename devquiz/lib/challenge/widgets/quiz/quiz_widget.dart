import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.heading,
            ),
            SizedBox(height: 24),
            AwnserWidget(title: "Possibilita perere pão duro", isRight: false, isSelected: true,),
            AwnserWidget(title: "Possibilita perere pão duro"),
            AwnserWidget(title: "Possibilita perere pão duro"),
            AwnserWidget(title: "Possibilita perere pão duro")
          ],
        ),
      ),
    );
  }
}