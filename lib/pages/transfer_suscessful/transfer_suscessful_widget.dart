import 'package:abu_bank/helper/add_pdf.dart';
import 'package:abu_bank/providers/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '/main.dart';
import '../../helper/constants.dart';
import '../../theme/abu_bank_icon_button.dart';
import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import '../../theme/abu_bank_widgets.dart';
import 'transfer_suscessful_model.dart';

export 'transfer_suscessful_model.dart';

class TransferSuscessfulWidget extends StatefulWidget {
  final String amount;
  final String beneficiaryName;
  final String currencySign;
  final bool isTransfer;
  final String currency;
  final String beneficiaryBank;
  final String senderAccount;
  final String beneficiaryAccount;
  final String remark;

  const TransferSuscessfulWidget({
    required this.amount,
    required this.beneficiaryName,
    required this.currencySign,
    this.isTransfer = true,
    Key? key,
    required this.currency,
    required this.beneficiaryBank,
    required this.senderAccount,
    required this.beneficiaryAccount,
    required this.remark,
  }) : super(key: key);

  @override
  _TransferSuscessfulWidgetState createState() =>
      _TransferSuscessfulWidgetState();
}

class _TransferSuscessfulWidgetState extends State<TransferSuscessfulWidget> {
  late TransferSuscessfulModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransferSuscessfulModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  Future<String?> getPath(bool share) async {
    return addPdf(
        amount: widget.amount,
        beneficiaryName: widget.beneficiaryName,
        currency: widget.currency,
        senderAccount: widget.senderAccount,
        beneficiaryAccount: widget.beneficiaryAccount,
        transactionType: widget.isTransfer ? 'Transfer' : 'Withdrawal',
        beneficiaryBank: widget.beneficiaryBank,
        remark: widget.remark,
        share: share,
        senderName: '${userData?.firstName ?? ''} ${userData?.lastName ?? ''}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AbuBankTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/t-susceeful.svg',
                  width: 342.0,
                  height: 188.0,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: Text(
                            '${widget.isTransfer ? 'Transfer' : 'Withrawal'} successful!',
                            style:
                                AbuBankTheme.of(context).displaySmall.override(
                                      fontFamily: 'Poppins',
                                      color: AbuBankTheme.of(context).secondary,
                                    ),
                          ),
                        ),
                        Text(
                          'You have successfully ${widget.isTransfer ? 'transferred' : 'withdrawn'} ',
                          style: AbuBankTheme.of(context).bodyMedium,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Text(
                                '${widget.currencySign} ${numberFormat.format(double.parse(widget.amount.toString()))}',
                                style: AbuBankTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: AbuBankTheme.of(context).secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 2.0, 0.0),
                              child: Text(
                                'to',
                                style: AbuBankTheme.of(context).bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                widget.beneficiaryName,
                                style: AbuBankTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: AbuBankTheme.of(context).primary2,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () {
                  Provider.of<TabProvider>(context, listen: false).changeTab(0);
                  Navigator.pop(context);
                },
                text: 'Continue',
                options: FFButtonOptions(
                  width: 130.0,
                  height: 55.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: AbuBankIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor: AbuBankTheme.of(context).primary3,
                        icon: Icon(
                          Icons.share_rounded,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          String? path = await getPath(true);
                          if (path == null) return;

                          Share.shareXFiles(
                            [XFile(path)],
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: AbuBankIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: AbuBankTheme.of(context).primary3,
                      icon: Icon(
                        Icons.download_rounded,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        String? path = await getPath(false);
                        Fluttertoast.showToast(
                          msg: path == null
                              ? 'Failed to download'
                              : 'Receipt downloaded',
                          gravity: ToastGravity.CENTER,
                        );
                      },
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
