import 'package:abu_bank/pages/forgot_password/reset_password.dart';
import 'package:abu_bank/requests/authentication.dart';
import 'package:flutter/material.dart';

import '../../helper/custom_loader.dart';
import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_widgets.dart';

class EmailExists extends StatefulWidget {
  const EmailExists({super.key});

  @override
  State<EmailExists> createState() => _EmailExistsState();
}

class _EmailExistsState extends State<EmailExists> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: AbuBankTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AbuBankTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Forgot Password',
                      style: AbuBankTheme.of(context).headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 252.0,
              decoration: BoxDecoration(
                color: AbuBankTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30.0,
                    color: Color(0x123629B7),
                    offset: Offset(0.0, -5.0),
                    spreadRadius: 30.0,
                  )
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your email address ',
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: AbuBankTheme.of(context).secondaryText,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 20.0),
                            child: Container(
                              width: 300.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0x12000000),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: AbuBankTheme.of(context).orange,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _textEditingController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: AbuBankTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: AbuBankTheme.of(context)
                                            .primaryText,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    return val!.trim().isEmpty
                                        ? 'Email cannot be empty'
                                        : null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'A code would be texted to your email',
                          textAlign: TextAlign.center,
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: AbuBankTheme.of(context).secondaryText,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              CustomOverlay.showOverlay(context);
                              final response = await Authentication.emailExists(
                                  _textEditingController.text.trim());
                              CustomOverlay.dismissOverlay();

                              if (response['status']) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ResetPassword(
                                      email: _textEditingController.text.trim(),
                                      token: response['token'],
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(response['message']),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            text: 'Send',
                            options: FFButtonOptions(
                              width: 290.0,
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: AbuBankTheme.of(context).primary,
                              textStyle:
                                  AbuBankTheme.of(context).titleSmall.override(
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
          ),
        ],
      ),
    );
  }
}
