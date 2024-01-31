import 'package:flutter/material.dart';
import 'package:xstore/utils/constants/colors.dart';

class XCircularBackground extends StatelessWidget {
  const XCircularBackground({
    super.key,
    this.width = 400,
    this.height = 400,
    this.padding = 0,
    this.radius = 400,
    this.backgroundColor = XColors.white,
    this.child,
    this.margin,
  });

  final double width;
  final double height;
  final double padding;
  final EdgeInsets? margin;
  final double radius;
  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
