import 'package:flutter/material.dart';

class TimelineItem {
  final String title;
  final String subtitle;
  final String description;
  final Widget child;
  final Color bubbleColor;

  const TimelineItem({
    @required this.title,
    this.subtitle,
    this.description,
    @required this.child,
    @required this.bubbleColor,
  });
}
