import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  final Widget child;
  final Color? colour;
  final double width;
  final VoidCallback? onTap;
  const AppCircleButton({Key? key, required this.child, this.colour, this.width = 60.0, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      child: InkWell(
        child: child,
      ),
    );
  }
}
