import 'package:flutter/material.dart';
import 'package:limix_test/features/home/models/quick_actions_model.dart';

class CustomQuickActions extends StatelessWidget {
  const CustomQuickActions({super.key, required this.quickActionsModel});

  final QuickActionsModel quickActionsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 125,
      padding: EdgeInsets.symmetric(vertical: 11.99),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: quickActionsModel.containerBg,

                borderRadius: BorderRadius.circular(20),
              ),

              // color: Color(0xffD1FAE5),
              child: Icon(
                quickActionsModel.icon,
                color: quickActionsModel.iconColor,
              ),
            ),
          ),

          const SizedBox(height: 15),
          Center(child: Text(quickActionsModel.title)),
        ],
      ),
    );
  }
}
