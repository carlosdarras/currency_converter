
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      this.text,
      this.child,
      this.height,
      this.width,
      this.borderRadius,
      this.foregroundColor,
      this.visualDensity,
      this.verticalPadding,
      this.horizontalPadding,
      this.backgroundColor,
      this.elevation,
      this.shadowColor,
      required this.onPressed,
      this.fontSize,
      this.makeItOutLine = false,
      this.fontWight,
      this.borderColor,
      this.borderWidth,
      this.textColor})
      : super(key: key);
  final void Function() onPressed;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? foregroundColor;
  final VisualDensity? visualDensity;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final double? fontSize;
  final FontWeight? fontWight;
  final Color? textColor;
  final bool? makeItOutLine;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    if (makeItOutLine == false) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? 80.w, height ?? 6.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
          ),
          foregroundColor: foregroundColor ?? Theme.of(context).colorScheme.primary,
          visualDensity: visualDensity ?? VisualDensity.comfortable,
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 4.w,
              vertical: verticalPadding ?? 1.h),
          backgroundColor: backgroundColor ?? Colors.black,
          elevation: elevation ?? 0,
          shadowColor: shadowColor ?? Colors.red,
        ),
        child: child ??
            Text(
              text ?? "Create Account",
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: fontWight ?? FontWeight.normal,
                  fontSize: fontSize ?? 12.sp),
              textAlign: TextAlign.center,
            ),

      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? 80.w, height ?? 6.5.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              side: BorderSide(
                  color: borderColor ?? Colors.red, width: borderWidth ?? 5)),
          foregroundColor: foregroundColor ?? Colors.white,
          visualDensity: visualDensity ?? VisualDensity.comfortable,
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 4.w,
              vertical: verticalPadding ?? 1.h),
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation ?? 0,
          shadowColor: shadowColor ?? Colors.red,
        ),
        child: child ??
            Text(
              text ?? "Sign in",
              style: TextStyle(
                  color: textColor ?? Colors.red,
                  fontWeight: fontWight ?? FontWeight.normal,
                  fontSize: fontSize ?? 12.sp),
            ),
      );
    }
  }
}
