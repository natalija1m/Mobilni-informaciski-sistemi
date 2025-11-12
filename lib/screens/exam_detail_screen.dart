import 'package:flutter/material.dart';
import '../models/exam.dart';


class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String timeRemaining() {
    Duration diff = exam.dateTime.difference(DateTime.now());
    if (diff.isNegative) return "Испитот е завршен";
    int days = diff.inDays;
    int hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Датум и време: ${exam.dateTime.day.toString().padLeft(2,'0')}.${exam.dateTime.month.toString().padLeft(2,'0')}.${exam.dateTime.year} ${exam.dateTime.hour.toString().padLeft(2,'0')}:${exam.dateTime.minute.toString().padLeft(2,'0')}"
            ),
            SizedBox(height: 8),
            Text("Просторија: ${exam.rooms.join(', ')}"),
            SizedBox(height: 16),
            Text("Време до испит: ${timeRemaining()}"),
          ],
        ),
      ),
    );
  }
}