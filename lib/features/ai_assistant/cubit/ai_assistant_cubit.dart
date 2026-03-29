import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/ai_assistant_data.dart';
import '../data/model/chat_message_model.dart';
import 'ai_assistant_state.dart';

class AiAssistantCubit extends Cubit<AiAssistantState> {
  AiAssistantCubit() : super(AiAssistantInitial());

  final List<ChatMessageModel> messages = [
    ChatMessageModel(
      text:
      "Hello! I'm your LimiX AI Assistant. I can help you with water quality analysis, pond management tips, and answer questions about your farm. How can I assist you today?",
      isUser: false,
    ),
  ];

  final List<String> quickQuestions = [
    "What's the ideal pH for shrimp farming?",
    "How to reduce oxygen fluctuation?",
    "Analyze my farm performance",
    "Best feeding schedule",
  ];

  void loadInitialMessages() {
    emit(AiAssistantSuccessState(messages: List.from(messages)));
  }

  Future<void> sendMessageCubit(String text) async {
    if (text.trim().isEmpty) return;

    messages.add(
      ChatMessageModel(
        text: text.trim(),
        isUser: true,
      ),
    );

    emit(AiAssistantLoadingState(messages: List.from(messages)));

    try {
      final reply = await AiAssistantData.sendMessage(text.trim());

      messages.add(
        ChatMessageModel(
          text: reply,
          isUser: false,
        ),
      );

      emit(AiAssistantSuccessState(messages: List.from(messages)));
    } catch (e) {
      messages.add(
        ChatMessageModel(
          text: 'حدث خطأ في الاتصال. حاول مرة أخرى.',
          isUser: false,
        ),
      );

      emit(
        AiAssistantErrorState(
          messages: List.from(messages),
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
