import 'package:abu_bank/pages/forgot_password/reset_successful.dart';
import 'package:abu_bank/requests/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_widgets.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  final String token;
  const ResetPassword({super.key, required this.email, required this.token});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AbuBankTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: AbuBankTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 25.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Reset password',
                        style: AbuBankTheme.of(context).headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 30),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 5.0),
                              child: Text(
                                'Enter OTP',
                                style: AbuBankTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: AbuBankTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              19.0, 1.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _otpController,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFE0E0E0),
                              filled: true,
                              isDense: true,
                              hintText: 'OTP',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).orange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).orange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).error,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).error,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF455A64),
                              fontWeight: FontWeight.normal,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (val) {
                              return val!.trim().length < 4
                                  ? 'OTP is required'
                                  : null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 5.0),
                              child: Text(
                                'New password',
                                style: AbuBankTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: AbuBankTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              19.0, 1.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFE0E0E0),
                              filled: true,
                              isDense: true,
                              hintText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).orange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).orange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).error,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).error,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _showPassword = !_showPassword,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AbuBankTheme.of(context).orange,
                                  size: 22.0,
                                ),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF455A64),
                              fontWeight: FontWeight.normal,
                            ),
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return val!.trim().isEmpty
                                  ? 'Password can not be empty'
                                  : val.trim().length < 6
                                      ? 'Password too short'
                                      : null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 5.0),
                              child: Text(
                                'Confirm password',
                                style: AbuBankTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: AbuBankTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              19.0, 1.0, 20.0, 10.0),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: !_showConfirmPassword,
                            decoration: InputDecoration(
                              fillColor: Color(0xFFE0E0E0),
                              filled: true,
                              isDense: true,
                              hintText: 'Confirm password',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).orange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).orange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).error,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AbuBankTheme.of(context).error,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _showConfirmPassword =
                                      !_showConfirmPassword,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _showConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AbuBankTheme.of(context).orange,
                                  size: 22.0,
                                ),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF455A64),
                              fontWeight: FontWeight.normal,
                            ),
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return _passwordController.text != val!
                                  ? 'Passwords do not match'
                                  : null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 10.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      final response =
                                          await Authentication.updatePassword(
                                        email: widget.email,
                                        otp: _otpController.text.trim(),
                                        password:
                                            _confirmPasswordController.text,
                                        token: widget.token,
                                      );

                                      if (response['status']) {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.scale,
                                            alignment: Alignment.bottomCenter,
                                            duration:
                                                Duration(milliseconds: 300),
                                            reverseDuration:
                                                Duration(milliseconds: 300),
                                            child: ResetPasswordSuccessful(
                                                email: widget.email),
                                          ),
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content:
                                                  Text(response['message']),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Close'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    }
                                  },
                                  text: 'Reset password',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: AbuBankTheme.of(context).primary,
                                    textStyle: AbuBankTheme.of(context)
                                        .titleSmall
                                        .override(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
