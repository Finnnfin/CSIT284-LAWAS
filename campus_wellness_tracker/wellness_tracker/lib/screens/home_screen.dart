
import 'package:flutter/material.dart';
import 'package:wellness_tracker/theme_controller.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.spa_rounded, color: colors.primary),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                'Wellness Tracker',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: const [
          ThemeToggleButton(),
          SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 750;
            final compact = constraints.maxWidth < 380;
            final horizontalPadding =
                wide ? 40.0 : compact ? 16.0 : 24.0;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                12,
                horizontalPadding,
                32,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1050),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Hero section
                      Container(
                        padding: EdgeInsets.all(wide ? 36 : 24),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF7952B3),
                              Color(0xFF533581),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: wide
                            ? Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: _heroContent(
                                      context,
                                      compact,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  const Expanded(
                                    child: Icon(
                                      Icons.self_improvement_rounded,
                                      size: 150,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : _heroContent(context, compact),
                      ),

                      const SizedBox(height: 28),

                      Text(
                        'Your wellness, your journey',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Small steps toward healthier everyday habits.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      const SizedBox(height: 20),

                      // Responsive feature cards
                      if (wide)
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _FeatureCard(
                                icon: Icons.favorite_rounded,
                                title: 'Healthy Habits',
                                description:
                                    'Reflect on the daily choices that support your well-being.',
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: _FeatureCard(
                                icon: Icons.insights_rounded,
                                title: 'Personal Insight',
                                description:
                                    'Review your score and understand your wellness classification.',
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: _FeatureCard(
                                icon: Icons.flag_rounded,
                                title: 'Next Steps',
                                description:
                                    'Get a recommendation to guide your wellness journey.',
                              ),
                            ),
                          ],
                        )
                      else
                        const Column(
                          children: [
                            _FeatureCard(
                              icon: Icons.favorite_rounded,
                              title: 'Healthy Habits',
                              description:
                                  'Reflect on the daily choices that support your well-being.',
                            ),
                            SizedBox(height: 12),
                            _FeatureCard(
                              icon: Icons.insights_rounded,
                              title: 'Personal Insight',
                              description:
                                  'Review your score and wellness classification.',
                            ),
                            SizedBox(height: 12),
                            _FeatureCard(
                              icon: Icons.flag_rounded,
                              title: 'Next Steps',
                              description:
                                  'Get a recommendation for your wellness journey.',
                            ),
                          ],
                        ),

                      const SizedBox(height: 24),

                      // Assessment information
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.assignment_outlined,
                                size: 32,
                                color: colors.primary,
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wellness Assessment',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Answer the questions to receive your score and recommendation.',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const QuizScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.play_arrow_rounded),
                          label: const Text('Start Assessment'),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Take a moment for yourself today.',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
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

  Widget _heroContent(BuildContext context, bool compact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            'YOUR DAILY WELLNESS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Make your well-being a priority.',
          style: TextStyle(
            color: Colors.white,
            fontSize: compact ? 28 : 34,
            fontWeight: FontWeight.bold,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Check in with your habits, discover where you are, '
          'and take a step toward a healthier you.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: colors.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.4,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
