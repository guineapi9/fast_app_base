import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double width;
  final double height;
  final EdgeInsets padding;

  const ImageButton({
    super.key,
    required this.imagePath,
    required this.onTap,
    this.width = 26,
    this.height = 26,
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Tap(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
