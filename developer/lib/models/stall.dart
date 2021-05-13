import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.local_hotel, size: 40.0),
    title: 'Apartment Move',
    subtitle: 'Move youe studio, 1 or 2 bedroom apartments.',
  ),
  Option(
    icon: Icon(Icons.home, size: 40.0),
    title: 'Small Move',
    subtitle: 'An easy way to move few items.',
  ),
  Option(
    icon: Icon(Icons.table_chart, size: 40.0),
    title: 'Office Move',
    subtitle: 'Move your office furniture with ease.',
  ),
  Option(
    icon: Icon(Icons.people, size: 40.0),
    title: 'No trucks, Labor Only',
    subtitle: 'No vehicles, but a ton of muscle',
  ),
  Option(
    icon: Icon(Icons.watch_later, size: 40.0),
    title: 'Delivery & Pick Up',
    subtitle: 'Delivery your item at your home',
  ),
  Option(
    icon: Icon(Icons.help_outline, size: 40.0),
    title: 'Other',
    subtitle: '.',
  ),
];
