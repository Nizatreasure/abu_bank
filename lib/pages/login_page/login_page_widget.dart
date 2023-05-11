import 'package:abu_bank/helper/constants.dart';
import 'package:abu_bank/models/login_model.dart';
import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:abu_bank/requests/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:provider/provider.dart';

import '/main.dart';
import '/pages/forgot_password/forgot_password_widget.dart';
import '/pages/welcome_page/welcome_page_widget.dart';
import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import '../../theme/abu_bank_widgets.dart';
import 'login_page_model.dart';

export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  bool canVerify = false;
  String? storedPassword = '';
  String? email = '';
  bool loading = false;
  final LocalAuthentication auth = LocalAuthentication();
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    checkAvailability();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  checkAvailability() async {
    bool passwordExists = await storage.containsKey(key: 'password');
    bool emailExists = await storage.containsKey(key: 'email');
    if (passwordExists) storedPassword = await storage.read(key: 'password');
    if (emailExists) {
      email = await storage.read(key: 'email');
      _model.textController1.text = email ?? '';
    }
    bool isAble = await auth.canCheckBiometrics;

    canVerify = passwordExists && emailExists && isAble;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AbuBankTheme.of(context).primary,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: AbuBankTheme.of(context).primary,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 25.0),
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
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.scale,
                                alignment: Alignment.bottomCenter,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: WelcomePageWidget(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Sign in',
                          style:
                              AbuBankTheme.of(context).headlineMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: AbuBankTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Illustration.png',
                                width: 218.0,
                                height: 170.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 20.0),
                                child: Container(
                                  width: 310.0,
                                  height: 55.0,
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
                                      controller: _model.textController1,
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
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
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
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 10.0),
                                child: Container(
                                  width: 310.0,
                                  height: 55.0,
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
                                      controller: _model.textController2,
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
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
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model.passwordVisibility =
                                                !_model.passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: AbuBankTheme.of(context)
                                                .primaryText,
                                            size: 22.0,
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
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.scale,
                                        alignment: Alignment.bottomCenter,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: ForgotPasswordWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Forgot your password ?',
                                    textAlign: TextAlign.end,
                                    style: AbuBankTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 20.0, 5.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await _signIn(
                                      email: _model.textController1.text.trim(),
                                      password:
                                          _model.textController2.text.trim(),
                                    );
                                  },
                                  fingerprintLoading: loading,
                                  text: 'Sign in',
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
                        if (canVerify)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (loading) return;
                                    try {
                                      final bool authenticate =
                                          await auth.authenticate(
                                        localizedReason: 'Login',
                                        authMessages: <AuthMessages>[
                                          AndroidAuthMessages(
                                            signInTitle: 'Action Required',
                                            biometricHint:
                                                'Tap the sensor when you are ready',
                                          ),
                                        ],
                                      );

                                      if (authenticate) {
                                        setState(() {
                                          loading = true;
                                        });
                                        await _signIn(
                                            email: email!,
                                            password: storedPassword!);
                                        loading = false;
                                        if (mounted) setState(() {});
                                      }
                                    } on PlatformException {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Could not authenticate. Try logging in with password ',
                                            style: AbuBankTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      AbuBankTheme.of(context)
                                                          .primary3,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              AbuBankTheme.of(context).green,
                                        ),
                                      );
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/images/Fingerprint.png',
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
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

  Future<void> _signIn(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) return;

    final response =
        await Authentication.login(email: email, password: password);
    if (response['status']) {
      await storage.write(key: 'password', value: password);
      await storage.write(key: 'email', value: email);
      userData = response['data'] as LoginModel;
      Provider.of<AccountDataProvider>(context, listen: false)
          .getAccountDetails();
      Provider.of<AccountDataProvider>(context, listen: false).getBanks();
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration(milliseconds: 300),
          child: NavBarPage(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response['message'],
            style: AbuBankTheme.of(context).titleSmall.override(
                  fontFamily: 'Poppins',
                  color: AbuBankTheme.of(context).primary3,
                ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: AbuBankTheme.of(context).error,
        ),
      );
    }
  }
}
