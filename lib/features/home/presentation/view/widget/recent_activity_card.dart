import 'package:flutter/material.dart';

class RecentActivityCard extends StatelessWidget {
  final List<ActivityItem> activities;

  const RecentActivityCard({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
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
                    padding: const EdgeInsets.only(bottom: 14),
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
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: item.color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${item.time} • Main Pond",
                style: TextStyle(
                  fontSize: 13,
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
