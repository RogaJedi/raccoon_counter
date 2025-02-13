import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ColorTemplate extends StatelessWidget {
  final Color borderColor;
  final Color mainColor;


  const ColorTemplate({
    super.key,
    required this.borderColor,
    required this.mainColor
  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: 74.w,
      height: 64.h,
      smoothness: 0.6, // Adjust this value to control the smoothness (0.0 to 1.0)
      color: Colors.transparent, // Set the background color if needed
      side: BorderSide(color: borderColor, width: 2),
      borderRadius: BorderRadius.circular(11),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Center(
          child: SmoothContainer(
            width: 65.33.w,
            height: 55.h,
            smoothness: 0.6,
            color: mainColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}