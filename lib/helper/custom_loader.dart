import 'package:flutter/material.dart';

class CustomOverlay {
  static BuildContext? _context;
  CustomOverlay();

  static showOverlay(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      barrierColor: Colors.transparent,
      context: context,
      builder: (pageContext) {
        _context = pageContext;
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
          ),
        );
      },
    );
  }

  static dismissOverlay() {
    if (_context != null && _context!.mounted) {
      Navigator.pop(_context!);
    }
  }
}
