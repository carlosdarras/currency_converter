import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerticalSpacing extends StatelessWidget {
  final double spacing;
  final double? width;

  const VerticalSpacing(this.spacing, {this.width , Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing.h,
      width: width ?? 100.0.w,
    );
  }
}
