import 'package:flutter/material.dart';

class TimelineItem {
  final String title;
  final String subtitle;
  final String description;
  final Widget icon;
  final Color bubbleColor;

  TimelineItem({
    @required this.title,
    this.subtitle,
    this.description,
    @required this.icon,
    @required this.bubbleColor,
  });
}
