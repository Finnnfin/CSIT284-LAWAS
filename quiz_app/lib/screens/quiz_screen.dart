class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final question = questions[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(24.0),
        child: Column(
          mainaxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 21.0),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
             shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: false,
                    selectedAnswerIndex: 0,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}