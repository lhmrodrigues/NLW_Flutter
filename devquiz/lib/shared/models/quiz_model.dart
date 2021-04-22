import 'dart:convert';

import 'package:devquiz/shared/models/question_model.dart';

enum Level{
  facil,
  medio,
  dificil,
  perito
}

extension LevelStringExtension on String {
  Level get parse => {
    "facil" : Level.facil, 
    "medio" : Level.medio, 
    "dificil" : Level.dificil, 
    "perito" : Level.perito
  }[this]!;
}

extension LevelExtension on Level {
  String get parse => {
    Level.facil : "facil", 
    Level.medio: "medio", 
    Level.dificil : "dificil", 
    Level.perito : "perito"  
  }[this]!;
}

class QuizModel {
  final String title;
  final String image;
  final int questionAnswereds;
  final Level level;
  final List<QuestionModel> questions;

  QuizModel({
    required this.title, 
    required this.image,
    this.questionAnswereds = 0,
    required this.questions,
    required this.level
    });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswereds': questionAnswereds,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswereds: map['questionAnswereds'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
