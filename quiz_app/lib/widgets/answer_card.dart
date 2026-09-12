import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;  
    bool isSelectedAnswer = !isCorrectAnswer && isSelected;
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
    ),
    child: selectedAnswerIndex != null
    ? Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 72, 0, 145)
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isCorrectAnswer
                ? Colors.green
                : isSelectedAnswer
                    ? Colors.red
                    : Colors.transparent,
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
            isCorrectAnswer
                ? buildCorrectIcon()
                : isWrongAnswer
                    ?buildWrongIcon()
                    :const SizedBox.shrink(),
          ],
        ),
    ),
     : Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 72, 0, 145)
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

Widget buildCorrectIcon() => const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.green,
  child: Icon(
    Icons.check,
    size: 16,
    color: Colors.white,
  ),
);

Widget buildWrongIcon() => const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.red,
  child: Icon(
    Icons.close,
    size: 16,
    color: Colors.white,
  ),
);