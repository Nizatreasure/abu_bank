import 'package:abu_bank/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import '../../theme/abu_bank_widgets.dart';

class ResetPasswordSuccessful extends StatefulWidget {
  final String email;
  const ResetPasswordSuccessful({super.key, required this.email});

  @override
  State<ResetPasswordSuccessful> createState() =>
      _ResetPasswordSuccessfulState();
}

class _ResetPasswordSuccessfulState extends State<ResetPasswordSuccessful> {
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    saveEmail(widget.email);
  }

  saveEmail(String email) async {
    await storage.write(key: 'email', value: email);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Image.asset(
                  'assets/images/Illustration.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Password reset\nsuccessful!',
                      textAlign: TextAlign.center,
                      style: AbuBankTheme.of(context).displaySmall.override(
                            fontFamily: 'Poppins',
                            color: AbuBankTheme.of(context).orange,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have successfully reset password.\nPlease use the new password to Sign in.',
                      textAlign: TextAlign.center,
                      style: AbuBankTheme.of(context).titleSmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: LoginPageWidget(),
                          ),
                          (route) => false,
                        );
                      },
                      text: 'Continue ',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 55.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: AbuBankTheme.of(context).primary,
                        textStyle: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
