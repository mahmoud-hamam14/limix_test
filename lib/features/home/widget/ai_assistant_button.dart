import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/ai_assistant/view/ai_assistant_screen.dart';

class AiAssistantButton extends StatelessWidget {
  const AiAssistantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.radius,
      right: 16.radius,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AiAssistantScreen()),
          );
        },
        child: Container(
          width: 60.width,
          height: 60.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xff2457C5), Color(0xff4F7DFF)],
            ),
            border: Border.all(color: Colors.white, width: 2.radius),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12.radius,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Icon(Icons.smart_toy, color: Colors.white, size: 33.radius),
        ),
      ),
    );
  }
}
