
import 'package:flutter/material.dart';
import 'package:wellness_tracker/models/wellnessquestions.dart';
import 'package:wellness_tracker/screens/home_screen.dart';
import 'package:wellness_tracker/theme_controller.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    if (selectedAnswerIndex != null) return;

    setState(() {
      selectedAnswerIndex = value;
      score += wellnessquestions[questionIndex].scores[value];
    });
  }

  void nextQuestion() {
    if (selectedAnswerIndex == null) return;

    if (questionIndex < wellnessquestions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
      });
      return;
    }

    final navigator = Navigator.of(context);

    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          score: score,
          onRestart: () {
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = wellnessquestions[questionIndex];
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness Assessment'),
        actions: const [ThemeToggleButton()],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final landscape =
                MediaQuery.orientationOf(context) ==
                    Orientation.landscape;
            final wide = constraints.maxWidth >= 750;
            final compact = constraints.maxWidth < 360 ||
                constraints.maxHeight < 420;

            final padding = wide ? 32.0 : compact ? 12.0 : 22.0;
            final questionFont = wide ? 28.0 : compact ? 18.0 : 22.0;
            final answerFont = compact ? 14.0 : 16.0;
            final sideBySide = wide ||
                (landscape && constraints.maxWidth >= 500);

            final questionPanel = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'QUESTION ${questionIndex + 1} '
                  'OF ${wellnessquestions.length}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colors.primary,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: (questionIndex + 1) /
                        wellnessquestions.length,
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  question.question,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: questionFont,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            );

            final answersPanel = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(question.options.length, (index) {
                  final selected = selectedAnswerIndex == index;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: selectedAnswerIndex == null
                            ? () => pickAnswer(index)
                            : null,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: selected
                              ? colors.primary
                              : colors.surface,
                          foregroundColor: selected
                              ? colors.onPrimary
                              : colors.onSurface,
                          disabledBackgroundColor: selected
                              ? colors.primary
                              : colors.surfaceContainerHighest,
                          disabledForegroundColor: selected
                              ? colors.onPrimary
                              : colors.onSurface,
                          side: BorderSide(
                            color: selected
                                ? colors.primary
                                : colors.outlineVariant,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: compact ? 12 : 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              selected
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                question.options[index],
                                style: TextStyle(fontSize: answerFont),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedAnswerIndex == null
                        ? null
                        : nextQuestion,
                    child: Text(
                      questionIndex == wellnessquestions.length - 1
                          ? 'Finish Assessment'
                          : 'Next Question',
                    ),
                  ),
                ),
              ],
            );

            return SingleChildScrollView(
              padding: EdgeInsets.all(padding),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1050),
                  child: sideBySide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: questionPanel,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(child: answersPanel),
                          ],
                        )
                      : Column(
                          children: [
                            questionPanel,
                            SizedBox(height: compact ? 20 : 32),
                            answersPanel,
                          ],
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
