import 'package:flutter/material.dart';
import 'package:pomodoro_app/core/constants/color.dart';
import 'package:pomodoro_app/core/constants/font.dart';

void showCenteredNotification(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: true, 
    builder: (context) => AlertDialog(
      content: Text(message, style: frindly,),
      contentPadding: const EdgeInsets.all(16),
      backgroundColor: btn.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // Tutup otomatis setelah 2 detik
  Future.delayed(const Duration(seconds: 2), () {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  });
}