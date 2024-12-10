import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class MotionToastUtils {
  static void showSuccess(BuildContext context, String title, String description) {
    MotionToast.success(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(description),
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
    ).show(context);
  }
  static void showError(BuildContext context, String title, String description) {
    MotionToast.error(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(description),
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
    ).show(context);
  }
}
