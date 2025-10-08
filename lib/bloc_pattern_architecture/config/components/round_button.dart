import 'package:bloclabs/bloc_pattern_architecture/config/color/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;

  const RoundButton({super.key, required this.title, required this.onPressed, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(color: AppColors.button, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }
}
