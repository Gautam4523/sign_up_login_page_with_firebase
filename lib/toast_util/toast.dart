import 'package:flutter/material.dart';

void showCustomToast(
    BuildContext context, String message, Color backgroundColor) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 60, // Adjust this value for center-top positioning
      left: MediaQuery.of(context).size.width * 0.1, // Center horizontally
      width: MediaQuery.of(context).size.width * 0.8,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  // Insert the overlay entry into the overlay
  overlay.insert(overlayEntry);

  // Remove the overlay entry after a delay
  Future.delayed(const Duration(seconds: 2)).then((_) => overlayEntry.remove());
}

void showErrorToast(BuildContext context, String message) {
  showCustomToast(context, message, Colors.red);
}

void showSuccessToast(BuildContext context, String message) {
  showCustomToast(context, message, Colors.green);
}
