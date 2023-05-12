import 'package:flutter/material.dart';

import '../theme/abu_bank_theme.dart';
import '../theme/abu_bank_widgets.dart';

class EnterBeneficiaryName extends StatefulWidget {
  const EnterBeneficiaryName({Key? key}) : super(key: key);

  @override
  State<EnterBeneficiaryName> createState() => _EnterBeneficiaryNameState();
}

class _EnterBeneficiaryNameState extends State<EnterBeneficiaryName> {
  final TextEditingController _accountNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AbuBankTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(0.0, -3.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Enter account name',
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: AbuBankTheme.of(context).primaryText,
                              ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel_rounded,
                            color: AbuBankTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 0.0,
                endIndent: 0.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 10.0),
                child: Container(
                  width: 332.0,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                    child: TextFormField(
                      controller: _accountNameController,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        labelText: 'Beneficiary Name',
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
                      style: AbuBankTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: AbuBankTheme.of(context).primaryText,
                          ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 10.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: _accountNameController.text.trim().isEmpty
                            ? null
                            : () async {
                                Navigator.pop(context,
                                    _accountNameController.text.trim());
                              },
                        text: 'Continue',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 55.0,
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
                          borderRadius: BorderRadius.circular(12.0),
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
    );
  }
}

Future<String?> enterBeneficiaryName(BuildContext context) async {
  return await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Color(0x00000000),
    isDismissible: false,
    context: context,
    builder: (bottomSheetContext) {
      return Padding(
        padding: MediaQuery.of(bottomSheetContext).viewInsets,
        child: Container(
          child: EnterBeneficiaryName(),
        ),
      );
    },
  );
}
