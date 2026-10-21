
import 'package:flutter/material.dart';
import 'package:wellness_tracker/theme_controller.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.score,
    required this.onRestart,
  });

  String get classification {
    if (score >= 20) return 'Excellent Wellness';
    if (score >= 15) return 'Healthy Balance';
    if (score >= 10) return 'Needs Improvement';
    return 'Poor Wellness';
  }

  String get recommendation {
    if (score >= 20) {
      return 'Excellent work! Continue maintaining your healthy lifestyle.';
    }
    if (score >= 15) {
      return 'Keep maintaining your current habits.';
    }
    if (score >= 10) {
      return 'Try improving your daily wellness habits step by step.';
    }
    return 'Start with small, healthy changes to improve your overall wellness.';
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness Tracker App'),
        actions: const [
          ThemeToggleButton(),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Text(
                'Assessment Completed!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Text(
                'Your Wellness Score: $score',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              Text(
                'Classification:',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              Text(
                classification,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              Text(
                'Recommendation:',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              Text(
                recommendation,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onRestart,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Restart Assessment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
