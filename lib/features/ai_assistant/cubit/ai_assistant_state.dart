import '../data/model/chat_message_model.dart';

sealed class AiAssistantState {}

final class AiAssistantInitial extends AiAssistantState {}

final class AiAssistantSuccessState extends AiAssistantState {
  final List<ChatMessageModel> messages;

  AiAssistantSuccessState({required this.messages});
}

final class AiAssistantLoadingState extends AiAssistantState {
  final List<ChatMessageModel> messages;

  AiAssistantLoadingState({required this.messages});
}

final class AiAssistantErrorState extends AiAssistantState {
  final List<ChatMessageModel> messages;
  final String errorMessage;

  AiAssistantErrorState({
    required this.messages,
    required this.errorMessage,
  });
}
