import 'package:flutter/material.dart';

class NotificationsCard extends StatefulWidget {
  const NotificationsCard({super.key});

  @override
  State<NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  bool masterSwitch = true;
  bool tempSwitch = true;
  bool oxygenSwitch = true;
  bool phSwitch = true;
  bool salinitySwitch = false;
  bool turbiditySwitch = false;
  bool criticalSwitch = true;
  bool dailyReportSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainSwitchRow(
            icon: Icons.notifications_outlined,
            title: "Push Notifications",
            subtitle: "Receive alerts on your device",
            value: masterSwitch,
            onChanged: (v) => setState(() => masterSwitch = v),
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFEEEEEE)),
          const SizedBox(height: 40),
          const Text(
            "PER SENSOR ALERTS",
            style: TextStyle(
              color: Color(0xff4A5565),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 12),
          _buildSensorRow(
            title: "🌡️ Temperature",
            value: tempSwitch,
            onChanged: (v) => setState(() => tempSwitch = v),
          ),
          _buildSensorRow(

            title: "💧 Oxygen",
            value: oxygenSwitch,
            onChanged: (v) => setState(() => oxygenSwitch = v),
          ),
          _buildSensorRow(
            title: "⚗️ pH Level",
            value: phSwitch,
            onChanged: (v) => setState(() => phSwitch = v),
          ),
          _buildSensorRow(
            title: "🌊 Salinity",
            value: salinitySwitch,
            onChanged: (v) => setState(() => salinitySwitch = v),
          ),
          _buildSensorRow(

            title: "🔍 Turbidity",
            value: turbiditySwitch,
            onChanged: (v) => setState(() => turbiditySwitch = v),
          ),

          const SizedBox(height: 10),
          const Divider(color: Color(0xFFEEEEEE),thickness: 2,),
          const SizedBox(height: 10),
          _buildMainSwitchRow(
            icon: Icons.notification_important_outlined,
            iconColor: Color(0xffE7000B),
            title: "Critical Alerts",
            subtitle: "Urgent notifications only",
            value: criticalSwitch,
            onChanged: (v) => setState(() => criticalSwitch = v),
          ),

          const SizedBox(height: 40),
          const Divider(color: Color(0xFFEEEEEE),thickness: 2,),
          const SizedBox(height: 40),

          _buildMainSwitchRow(
            icon: Icons.notifications_outlined,
            iconColor: Color(0xff155DFC),
            title: "Daily Reports",
            subtitle: "Get daily summaries",
            value: dailyReportSwitch,
            onChanged: (v) => setState(() => dailyReportSwitch = v),
          ),
        ],
      ),
    );
  }


  Widget _buildMainSwitchRow({
    required IconData icon,
    Color iconColor = const Color(0xFF0891B2),
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 28),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xff6A7282), fontSize: 12),
              ),
            ],
          ),
        ),
        Transform.scale(
          scale: 0.9,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFF3B82F6),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Color(0xFFE5E7EB),
          ),
        ),
      ],
    );
  }
  Widget _buildSensorRow({

    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff364153),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: const Color(0xFF3B82F6),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Color(0xFFE5E7EB),
            ),
          ),
        ],
      ),
    );
  }
}