import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  ExamCard({required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.dateTime.isBefore(DateTime.now());
    return Card(
      // ако е поминат, нежно црвена; ако е иднина, светло зелена
      color: isPast ? Colors.red[100] : Colors.green[100],
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(exam.name),
        subtitle: Row(
          children: [
            Icon(Icons.calendar_today, size: 16),
            SizedBox(width: 4),
            Text(
                "${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year} ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2,'0')}"),
            SizedBox(width: 10),
            Icon(Icons.room, size: 16),
            SizedBox(width: 4),
            Text(exam.rooms.join(", ")),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}