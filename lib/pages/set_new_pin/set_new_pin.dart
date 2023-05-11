import 'package:abu_bank/helper/custom_loader.dart';
import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:abu_bank/requests/accounts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_widgets.dart';

class SetNewPin extends StatefulWidget {
  const SetNewPin({Key? key}) : super(key: key);

  @override
  State<SetNewPin> createState() => _SetNewPinState();
}

class _SetNewPinState extends State<SetNewPin> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();
  bool _hidePin = true;
  bool _hideConfirmPin = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AbuBankTheme.of(context).primaryBackground,
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
                        'Set New Pin',
                        style: AbuBankTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).primaryText,
                              fontSize: 18,
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
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0.0, 0.0, 10.0),
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
                          controller: _pinController,
                          obscureText: _hidePin,
                          maxLength: 4,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            labelText: 'Enter pin',
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
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _hidePin = !_hidePin,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                !_hidePin
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AbuBankTheme.of(context).primaryText,
                                size: 22.0,
                              ),
                            ),
                          ),
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: AbuBankTheme.of(context).primaryText,
                              ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0.0, 0.0, 10.0),
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
                          controller: _confirmPinController,
                          obscureText: _hideConfirmPin,
                          maxLength: 4,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            labelText: 'Confirm pin',
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
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _hideConfirmPin = !_hideConfirmPin,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                !_hideConfirmPin
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AbuBankTheme.of(context).primaryText,
                                size: 22.0,
                              ),
                            ),
                          ),
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: AbuBankTheme.of(context).primaryText,
                              ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: SizedBox(
                width: 310,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: _pinController.text.trim().length < 4 ||
                              _confirmPinController.text.trim().length < 4 ||
                              _confirmPinController.text != _pinController.text
                          ? null
                          : () async {
                              CustomOverlay.showOverlay(context);
                              final response = await Accounts.createPin(
                                  _pinController.text.trim());
                              CustomOverlay.dismissOverlay();
                              Navigator.pop(context);
                              if (response['status']) {
                                Provider.of<AccountDataProvider>(context,
                                        listen: false)
                                    .hasSetPin = true;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Pin created successfully!',
                                      style: AbuBankTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: AbuBankTheme.of(context)
                                                .primary3,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        AbuBankTheme.of(context).green,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      response['message'],
                                      style: AbuBankTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: AbuBankTheme.of(context)
                                                .primary3,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        AbuBankTheme.of(context).error,
                                  ),
                                );
                              }
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
