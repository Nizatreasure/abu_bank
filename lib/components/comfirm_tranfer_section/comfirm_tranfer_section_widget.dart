import 'package:aza_bank/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/aza_bank_theme.dart';
import '../../theme/aza_bank_util.dart';
import '../../theme/aza_bank_widgets.dart';
import 'comfirm_tranfer_section_model.dart';

export 'comfirm_tranfer_section_model.dart';

class ComfirmTranferSectionWidget extends StatefulWidget {
  final String beneficiaryName;
  final String beneficiaryAccount;
  final String bankName;
  final String accountNumber;
  final String amount;

  const ComfirmTranferSectionWidget({
    Key? key,
    required this.beneficiaryName,
    required this.beneficiaryAccount,
    required this.bankName,
    required this.accountNumber,
    required this.amount,
  }) : super(key: key);

  @override
  _ComfirmTranferSectionWidgetState createState() =>
      _ComfirmTranferSectionWidgetState();
}

class _ComfirmTranferSectionWidgetState
    extends State<ComfirmTranferSectionWidget> {
  late ComfirmTranferSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComfirmTranferSectionModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.0,
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
          mainAxisSize: MainAxisSize.max,
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
                        'Comfirm Tansaction',
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
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'From Account',
                        style: AbuBankTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.accountNumber,
                        style: AbuBankTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Beneficiary',
                        style: AbuBankTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.beneficiaryName,
                        style: AbuBankTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Beneficiary Account',
                        style: AbuBankTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.beneficiaryAccount,
                        style: AbuBankTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Beneficiary Bank',
                        style: AbuBankTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.bankName,
                        style: AbuBankTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Amount',
                        style: AbuBankTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '\u20A6 ${numberFormat.format(double.parse(widget.amount.toString()))}',
                        style: AbuBankTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: AbuBankTheme.of(context).secondaryText,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 20.0),
                    child: Container(
                      width: 320.0,
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
                          controller: _model.textController,
                          obscureText: false,
                          maxLength: 4,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Enter Your 4 Digit Pin',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
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
                            counterText: '',
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
                          keyboardType: TextInputType.number,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 10.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(
                            context, _model.textController.text.trim());
                      },
                      text: 'Comfirm',
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
    );
  }
}
