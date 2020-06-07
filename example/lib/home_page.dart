import 'package:bubble_timeline/timeline_item.dart';
import 'package:flutter/material.dart';
import 'package:bubble_timeline/bubble_timeline.dart';

class HomePage extends StatelessWidget {
  final List<TimelineItem> _items = [
    TimelineItem(
      title: 'Boat',
      subtitle: 'Travel through Oceans',
      child: Icon(
        Icons.directions_boat,
        color: Colors.white,
      ),
      bubbleColor: Colors.grey,
    ),
    TimelineItem(
      title: 'Bike',
      subtitle: 'Road Trips are best',
      child: Icon(
        Icons.directions_bike,
        color: Colors.white,
      ),
      bubbleColor: Colors.grey,
    ),
    TimelineItem(
      title: 'Bus',
      subtitle: 'I like to go with friends',
      child: Icon(
        Icons.directions_bus,
        color: Colors.white,
      ),
      bubbleColor: Colors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bubble Timeline'),
      ),
      body: Center(
        child: Container(
          child: BubbleTimeline(
            bubbleDiameter: 120,
            items: _items,
            stripColor: Colors.teal,
            scaffoldColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
