import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor:
                      (data['user_answer'] == data['correct_answer'])
                      ? const Color.fromARGB(255, 7, 184, 80)
                      : const Color.fromARGB(255, 220, 20, 60),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      Text(
                        'Your answer: ${data['user_answer']}',
                        style: TextStyle(
                          color: (data['user_answer'] == data['correct_answer'])
                              ? const Color.fromARGB(255, 7, 184, 80)
                              : const Color.fromARGB(255, 220, 20, 60),
                        ),
                      ),
                      Text(
                        'Correct answer: ${data['correct_answer']}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 7, 184, 80),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
