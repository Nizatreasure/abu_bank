import 'package:flutter/material.dart';

import '../theme/abu_bank_theme.dart';

class CustomLoader {
  static BuildContext? _context;
  CustomLoader();

  static showLoader(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 0.15 * width,
                width: 0.15 * width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AbuBankTheme.of(context).secondaryBackground,
                ),
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(AbuBankTheme.of(context).primary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static dismissLoader() {
    if (_context != null && _context!.mounted) {
      Navigator.pop(_context!);
    }
  }
}
