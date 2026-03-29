import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/constants/custom_appbar.dart';

import '../../settings/view/settings_screen.dart';
import '../cubit/ai_assistant_cubit.dart';
import '../cubit/ai_assistant_state.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_input_bar.dart';
import 'widgets/typing_indicator.dart';
import 'widgets/welcome_section.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiAssistantCubit()..loadInitialMessages(),
      child: const _AiAssistantBody(),
    );
  }
}

class _AiAssistantBody extends StatefulWidget {
  const _AiAssistantBody();

  @override
  State<_AiAssistantBody> createState() => _AiAssistantBodyState();
}

class _AiAssistantBodyState extends State<_AiAssistantBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    context.read<AiAssistantCubit>().sendMessageCubit(text);
    _controller.clear();
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AiAssistantCubit>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          title: "AI Assistant",
          subTitle: "Online",
          showBackButton: true,
          showOnlineDot: true,
          iconBgColor: const Color(0xff9AD8F1),
          icon: Icons.smart_toy_outlined,
          iconColor: const Color(0xff01378E),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),));
          },
        ),
      ),
      body: BlocConsumer<AiAssistantCubit, AiAssistantState>(
        listener: (context, state) {
          if (state is AiAssistantLoadingState ||
              state is AiAssistantSuccessState ||
              state is AiAssistantErrorState) {
            _scrollToBottom();
          }
        },
        builder: (context, state) {
          if (state is AiAssistantInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List messages = [];
          bool isLoading = false;

          if (state is AiAssistantSuccessState) {
            messages = state.messages;
          } else if (state is AiAssistantLoadingState) {
            messages = state.messages;
            isLoading = true;
          } else if (state is AiAssistantErrorState) {
            messages = state.messages;
          }

          return Column(
            children: [
              Expanded(
                child: messages.length == 1
                    ? WelcomeSection(
                  welcomeMessage: messages.first,
                  questions: cubit.quickQuestions,
                  onTapQuestion: (question) {
                    context
                        .read<AiAssistantCubit>()
                        .sendMessageCubit(question);
                    _scrollToBottom();
                  },
                )
                    : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(message: messages[index]);
                  },
                ),
              ),
              if (isLoading) const TypingIndicator(),
              ChatInputBar(
                controller: _controller,
                onSend: _sendMessage,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}