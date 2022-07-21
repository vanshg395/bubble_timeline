library bubble_timeline;

import 'package:flutter/material.dart';
import 'package:bubble_timeline/timeline_item.dart';

class Config {
  static String rightDirection = 'R';
  static String leftDirection = 'L';
}

/// A Bubble Timeline Widget.
class BubbleTimeline extends StatefulWidget {
  final double bubbleDiameter;
  final List<TimelineItem> items;
  final Color stripColor;

  /// This is color of your scaffold.
  /// Use same color as used for Scaffold background.
  final Color scaffoldColor;

  const BubbleTimeline({
    required this.bubbleDiameter,
    required this.items,
    required this.stripColor,
    required this.scaffoldColor,
  });

  @override
  _BubbleTimelineState createState() => _BubbleTimelineState();
}

class _BubbleTimelineState extends State<BubbleTimeline> {
  bool checkEven(int n) {
    return n % 2 == 0;
  }

  List<TimelineBubble> createTimeline() {
    final List<TimelineBubble> _items = [];
    for (var i = 0; i < widget.items.length; i++) {
      _items.add(
        TimelineBubble(
          direction:
              checkEven(i) ? Config.leftDirection : Config.rightDirection,
          size: widget.bubbleDiameter,
          title: widget.items[i].title,
          subtitle: widget.items[i].subtitle,
          description: widget.items[i].description,
          icon: widget.items[i].child,
          stripColor: widget.stripColor,
          bubbleColor: widget.items[i].bubbleColor,
          bgColor: widget.scaffoldColor,
        ),
      );
    }
    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TopHandle(widget.stripColor),
            ...createTimeline(),
            BottomHandle(widget.stripColor),
          ],
        ),
      ),
    );
  }
}

class TopHandle extends StatelessWidget {
  final Color handleColor;
  const TopHandle(this.handleColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: handleColor,
            shape: BoxShape.circle,
          ),
          height: 10,
        ),
        Container(
          height: 20,
          width: 2,
          color: handleColor,
        ),
      ],
    );
  }
}

class BottomHandle extends StatelessWidget {
  final Color handleColor;
  const BottomHandle(this.handleColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          width: 2,
          color: handleColor,
        ),
        Container(
          decoration: BoxDecoration(
            color: handleColor,
            shape: BoxShape.circle,
          ),
          height: 10,
        ),
      ],
    );
  }
}

class TimelineBubble extends StatelessWidget {
  final String direction;
  final double size;
  final String title;
  final String? subtitle;
  final String? description;
  final Widget icon;
  final Color stripColor;
  final Color bgColor;
  final Color bubbleColor;

  const TimelineBubble({
    required this.direction,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.stripColor,
    required this.bgColor,
    required this.bubbleColor,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: direction == Config.leftDirection
                ? <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff413945),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        subtitle!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff413945),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                    if (description != null) ...[
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        description!,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ]
                : [],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10,
                width: 2,
                color: stripColor,
              ),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: size,
                      child: ClipPath(
                        child: Container(
                          width: size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: stripColor,
                          ),
                        ),
                        clipper: direction == Config.leftDirection
                            ? LeftClipper()
                            : RightClipper(),
                      ),
                    ),
                    Container(
                      height: size - 4,
                      width: size - 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                      ),
                    ),
                    Container(
                      height: size - 9,
                      width: size - 9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bubbleColor,
                      ),
                      alignment: Alignment.center,
                      child: icon,
                    ),
                  ],
                ),
              ),
              Container(height: 10, width: 2, color: stripColor),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: direction == Config.rightDirection
                ? <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1,
                        color: Color(0xff413945),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        subtitle!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          height: 1,
                          color: Color(0xff413945),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                    if (description != null) ...[
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        description!,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ]
                : [],
          ),
        ),
      ],
    );
  }
}

class RightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2 + 1, size.height);
    path.lineTo(size.width / 2 + 1, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2 - 1, size.height);
    path.lineTo(size.width / 2 - 1, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
