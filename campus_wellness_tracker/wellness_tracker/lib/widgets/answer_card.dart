import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
    ),
    child: selectedAnswerIndex != null
    ? Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 72, 0, 145),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ),
            const SizedBox(height: 10),
          ],
        ),
    )
     : Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 72, 0, 145),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white24,
          )
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ),
          ],
        ),
     ),
  );
}
}

