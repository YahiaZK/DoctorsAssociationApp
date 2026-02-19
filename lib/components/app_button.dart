import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Gradient? gradient;
  final Color? color;
  final double width;
  final double height;
  final double borderRadius;
  const AppButton({
    super.key,
    required this.child,
    this.onPressed,
    this.gradient,
    this.color,
    this.width = 210,
    this.height = 45.0,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Center(child: child),
        ),
      ),
    );
  }
}
