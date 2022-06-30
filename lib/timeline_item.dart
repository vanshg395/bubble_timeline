import 'package:flutter/material.dart';

class TimelineItem {
  final String title;
  final String? subtitle;
  final String? description;
  final Widget child;
  final Color bubbleColor;

  const TimelineItem({
    /*required*/ required this.title,
    this.subtitle,
    this.description,
    /*required*/ required this.child,
    /*required*/ required this.bubbleColor,
  });
}
