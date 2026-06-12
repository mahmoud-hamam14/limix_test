import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class RecentActivityCard extends StatelessWidget {
  final List<ActivityItem> activities;

  const RecentActivityCard({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Column(
        children:
            activities
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.only(bottom: 18.height),
                    child: _ActivityRow(item: item),
                  ),
                )
                .toList(),
      ),
    );
  }
}

class ActivityItem {
  final Color color;
  final String title;
  final String time;

  ActivityItem({required this.color, required this.title, required this.time});
}

class _ActivityRow extends StatelessWidget {
  final ActivityItem item;

  const _ActivityRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12.width,
          height: 12.height,
          decoration: BoxDecoration(shape: BoxShape.circle, color: item.color),
        ),
        SizedBox(width: 15.width),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 16.font,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.height),
              Text(
                "${item.time} • Main Pond",
                style: TextStyle(
                  fontSize: 14.font,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
