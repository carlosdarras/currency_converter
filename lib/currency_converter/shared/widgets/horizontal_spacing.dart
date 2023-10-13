import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HorizontalSpacing extends StatelessWidget {
  final double spacing;
  final double? height;

   const HorizontalSpacing(this.spacing, {this.height,Key? key }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spacing.w,
      height: height ?? 0.0.h,
    );
  }
}
