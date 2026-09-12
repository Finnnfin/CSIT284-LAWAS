import 'package:flutter_app/models/question.dart';

const List<Question> sampleQuestions = [
  Question(
    question: 'What are the main building blocks of Flutter UIs?',
    options: ['Functions', 'Components', 'Blocks', 'Widgets'],
    correctAnswerIndex: 3,
  ),
  Question(
    question: 'How are Flutter UIs built?', 
    options: [
      'By combining widgets in a visual editor',
      'By using XCode for iOS and Android Studio for Android',
      'By combining widgets in code',
      'By defining widgets in config files',
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    question: "What's the purpose of a StatefulWidget?",
    options: [
      'Render UI that does not depend on data',
      'Update data as UI changes',
      'Ignore data changes',
      'Update UI as data changes',
    ],
    correctAnswerIndex: 4,
  ),
  Question(
    question: "Which widget should you try to use more often: StatelessWidget or StatefulWidget?",
    options: [
      'None of the above',
      'StatefulWidget',
      'StatelessWidget',
      'Both are equally important',
    ],
    correctAnswerIndex: 3,
  ),
  Question(
    question: "What happens when you change data in a StatelessWidget?",
    options: [
      'The closest StatefulWidget is updated',
      'The UI is updated',
      'Any nested StatefulWidgets are updated',
      'The UI is not updated',
    ],
    correctAnswerIndex: 4,
  ),
  Question(
    question: "How should you update data inside of a StatefulWidget?",
    options: [
      'By calling setState()',
      'By calling updateUI()',
      'By calling updateData()',
      'By calling updateState()',
    ],
    correctAnswerIndex: 1,
  ),
];