import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final IconData icon;
  final Color baseColor; 

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.icon,
    required this.baseColor, 
  });

  @override
  Widget build(BuildContext context) {
 
    final Color lightColor = baseColor.withOpacity(0.08); 
    
    final Color veryLightColor = baseColor.withOpacity(0.02);

    return Container(
      height: 158.5167694091797,
      width: 101.45551300048828,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
    
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightColor, 
            veryLightColor, 
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      
        border: Border.all(color: baseColor.withOpacity(0.2)),
      
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // --- الأيقونة (من غير خلفية داخلية) ---
              Icon(icon, color: baseColor, size: 24), // كبرت الأيقونة شوية
              // --- النص (+12%) ---
              Text(
                change,
                style: TextStyle(
                  color: baseColor, 
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF224B8F), 
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54, 
            ),
          ),
        ],
      ),
    );
  }
}