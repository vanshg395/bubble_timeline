# Bubble Timeline Package

A Flutter Widget to make interactive timeline widget.

This widget can be used to make Event Timelines, or Timelines for certain travel journey. This widget provides easy customisation of individual event bubbles.

## Screenshots

<img src="https://github.com/vanshg395/bubble_timeline/blob/master/screenshot.png?raw=true" height="500px">

## Installing

To use this package:

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
    bubble_timeline: ^1.0.5
```

## How to Use

Simply create a `BubbleTimeline` widget, and pass the required params:

```dart
 BubbleTimeline(
    bubbleDiameter: 120,
    // List of Timeline Bubble Items
    items: [
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
    ],
    stripColor: Colors.teal,
    scaffoldColor: Colors.white,
)        
```


Use `TimelineItem` to add items in Timeline.

```dart
TimelineItem(
    title: 'Title',
    subtitle: 'Subtitle',
    description: 'Description',
    child: Icon(
        Icons.directions_bus,
    ),
    bubbleColor: Colors.blue,
),
```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## CONTRIBUTORS

* [Vansh Goel](https://github.com/vanshg395/)

## LICENSE

GNU GENERAL PUBLIC LICENSE 3.0

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)



