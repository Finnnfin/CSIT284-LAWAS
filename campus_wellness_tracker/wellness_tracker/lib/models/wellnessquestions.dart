
import 'package:wellness_tracker/models/wellness.dart';

const List<wellnessQuestion> wellnessquestions = [
  wellnessQuestion(
    question: 'How many hours do you typically sleep?',
    options: [
      '5-6 hours',
      '7-8 hours',
      '9-10 hours',
    ],
    scores: [1, 5, 3],
  ),
  wellnessQuestion(
    question: 'How often do you engage in physical activity?',
    options: [
      'Rarely or Never',
      '2-4 times a week',
      'Daily',
    ],
    scores: [1, 3, 5],
  ),
  wellnessQuestion(
    question: 'How would you rate your stress levels on a typical day?',
    options: [
      'Low',
      'Moderate',
      'High',
    ],
    scores: [5, 3, 1],
  ),
  wellnessQuestion(
    question: 'How often do you eat fresh fruits and vegetables?',
    options: [
      'Less than once a day',
      '1-2 servings daily',
      '3 or more servings daily',
    ],
    scores: [1, 3, 5],
  ),
  wellnessQuestion(
    question: 'How often do you take time for relaxation or hobbies you enjoy?',
    options: [
      'Rarely',
      'A few times a week',
      'Daily',
    ],
    scores: [1, 3, 5],
  ),
];
