import 'package:flutter/material.dart';

class ContainerModel {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final Color startColor;
  final Color endColor;
  final Color iconColor;
  final Color iconBgColor;
  final Color valueColor;

  ContainerModel({
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    required this.startColor,
    required this.endColor,
    required this.iconColor,
    required this.iconBgColor,
    required this.valueColor,
  });
}
