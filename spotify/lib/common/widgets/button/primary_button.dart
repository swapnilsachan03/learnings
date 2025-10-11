import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const PrimaryButton({
    required this.onPressed,
    required this.title,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 64),
        foregroundColor: AppColors.lightBackground,
      ),
      child: Text(title),
    );
  }
}
