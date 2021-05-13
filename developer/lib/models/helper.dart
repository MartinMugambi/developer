import 'package:developer/models/option_model.dart';
import 'package:flutter/material.dart';
class Helper{
Icon icon;
String title;
String  subtitle;

Helper(
  this.icon, 
  this.title, 
  this.subtitle
  );
}

final option=[
Option(
 icon: Icon(Icons.person),
 title: '2+ Helpers',
 subtitle: 'Two helpers with a vehicle will arrive to get your items quick an easy',
),
Option(
 icon: Icon(Icons.people),
 title: ' 1 Helper + You',
 subtitle: 'You can save mmoney by helping!',
),
Option(
  icon: Icon(Icons.personal_video),
  title: '1 Helper',
  subtitle: 'One helper is perfect for boxew, bags, or items can be carried with 2 hands',
)
];