import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(name: "Програмирање на видео игри", dateTime: DateTime(2025, 11, 18, 13, 0), rooms: ["223"]),
    Exam(name: "Менаџмент на информациски системи", dateTime: DateTime(2025, 11, 18, 16, 30), rooms: ["117"]),
    Exam(name: "Веб базирани системи", dateTime: DateTime(2025, 11, 20, 18, 0), rooms: ["2"]),
    Exam(name: "Дизајн на интеракција човек-компјутер", dateTime: DateTime(2025, 1, 14, 15, 0), rooms: ["117"]),
    Exam(name: "Бази на податоци", dateTime: DateTime(2025, 1, 15, 8, 0), rooms: ["138"]),
    Exam(name: "Веб програмирање", dateTime: DateTime(2025, 1, 17, 14, 0), rooms: ["225"]),
    Exam(name: "Вовед во наука на податоци", dateTime: DateTime(2025, 1, 20, 15, 0), rooms: ["1"]),
    Exam(name: "Мултимедиски мрежи", dateTime: DateTime(2025, 1, 23, 15, 0), rooms: ["3"]),
    Exam(name: "Програмирање на видео игри", dateTime: DateTime(2026, 1, 13, 13, 0), rooms: ["223"]),
    Exam(name: "Менаџмент на информациски системи", dateTime: DateTime(2026, 1, 13, 16, 30), rooms: ["117"]),
    Exam(name: "Веб базирани системи", dateTime: DateTime(2026, 1, 15, 18, 0), rooms: ["2"]),
    // додади уште минимум 7 испити
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime)); // хронолошки редослед
    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - 221030"), // замени со број на индекс
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(
                  exam: exams[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(exam: exams[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text("Вкупно испити: ${exams.length}"),
            ),
          ),
        ],
      ),
    );
  }
}
