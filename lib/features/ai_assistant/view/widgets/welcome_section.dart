import 'package:flutter/material.dart';

import '../../data/model/chat_message_model.dart';
import 'chat_bubble.dart';
import 'quick_question_grid.dart';

class WelcomeSection extends StatelessWidget {
  final ChatMessageModel welcomeMessage;
  final List<String> questions;
  final Function(String) onTapQuestion;

  const WelcomeSection({
    super.key,
    required this.welcomeMessage,
    required this.questions,
    required this.onTapQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ChatBubble(message: welcomeMessage),
        const SizedBox(height: 16),
        QuickQuestionGrid(
          questions: questions,
          onTapQuestion: onTapQuestion,
        ),
      ],
    );
  }
}