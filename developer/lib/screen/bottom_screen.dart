import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final Function press;
  BottomNavigationItem(
      {@required this.iconData,
      @required this.isSelected,
      @required this.press});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Center(
        child: Icon(
          iconData,
          color: isSelected ? Colors.white : Colors.grey[600],
          size: 30.0,
        ),
      ),
    );
  }
}
