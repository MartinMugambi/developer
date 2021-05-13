import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String pric;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle, this.pric});
}

final options = [
  Option(
    icon: Icon(Icons.local_hotel, size: 40.0),
    title: 'Stall 1',
    subtitle: 'Size: 141ft2',
    pric: '600',
  ),
  Option(
    icon: Icon(Icons.home, size: 40.0),
    title: 'Stall 2',
    subtitle: 'Size: 143ft2.',
    pric: '700',
  ),
  Option(
    icon: Icon(Icons.table_chart, size: 40.0),
    title: 'Stall 3',
    subtitle: 'Size: 110ft2.',
    pric: '500',
  ),
  Option(
    icon: Icon(Icons.people, size: 40.0),
    title: 'Stall 4',
    subtitle: 'Size: 160ft2',
    pric: '900',
  ),
];
