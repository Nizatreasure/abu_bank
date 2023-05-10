import 'package:aza_bank/helper/account_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/pages/comfirm_tranfer/comfirm_tranfer_widget.dart';
import '../../components/comfirm_tranfer_section/comfirm_tranfer_section_widget.dart';
import '../../helper/prefix_add.dart';
import '../../helper/thousand_separator.dart';
import '../../theme/aza_bank_theme.dart';
import '../../theme/aza_bank_util.dart';
import '../../theme/aza_bank_widgets.dart';
import 'transfer_funds_model.dart';

export 'transfer_funds_model.dart';

class TransferFundsWidget extends StatefulWidget {
  const TransferFundsWidget({Key? key}) : super(key: key);

  @override
  _TransferFundsWidgetState createState() => _TransferFundsWidgetState();
}

class _TransferFundsWidgetState extends State<TransferFundsWidget> {
  late TransferFundsModel _model;
  int index = 0;
  final TextEditingController _beneficiaryNameController =
      TextEditingController();
  final TextEditingController _beneficiaryBankController =
      TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransferFundsModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    _model.textController5 ??= TextEditingController();
    _model.textController6 ??= TextEditingController();
    _model.textController7 ??= TextEditingController();
    _model.textController8 ??= TextEditingController();
    _model.textController9 ??= TextEditingController();
    _model.textController10 ??= TextEditingController();
    _model.pageViewController ??= PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AbuBankTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                  child: Row(
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
                          Icons.arrow_back_ios,
                          color: AbuBankTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Transfer Funds',
                          style: AbuBankTheme.of(context).headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                AccountContainer(),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Choose transaction',
                        style: AbuBankTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.pageViewController?.animateToPage(
                              0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 120.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? AbuBankTheme.of(context).primary
                                  : Color(0x96777777),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Color(0xFFF2F1F9),
                                    size: 32.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      'Transfer to\nthe same bank',
                                      style: AbuBankTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFE0E0E0),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: InkWell(
                          onTap: () {
                            _model.pageViewController?.animateToPage(
                              1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 120.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: index == 1
                                  ? AbuBankTheme.of(context).primary
                                  : Color(0x96777777),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.account_balance_rounded,
                                    color: Color(0xFFF2F1F9),
                                    size: 30.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      'Transfer to\nanother bank',
                                      style: AbuBankTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFE0E0E0),
                                          ),
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (value) {
                            setState(() {
                              index = value;
                            });
                          },
                          controller: _model.pageViewController,
                          children: [_transferSameBank(), _transferOtherBank()],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _transferSameBank() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _model.textController5,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 10,
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: 'Account Number',
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
                  keyboardType: TextInputType.number,
                  validator:
                      _model.textController5Validator.asValidator(context),
                ),
              ),
            ),
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
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _model.textController6,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsSeparatorInputFormatter(),
                    PrefixAdd('\u20A6'),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
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
                        fontFamily: 'Roboto',
                        color: AbuBankTheme.of(context).primaryText,
                      ),
                  keyboardType: TextInputType.number,
                  validator:
                      _model.textController6Validator.asValidator(context),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 10.0),
            child: Container(
              width: 332.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: Color(0x12000000),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: AbuBankTheme.of(context).orange,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _model.textController7,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Note',
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
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.textController7Validator.asValidator(context),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (_model.textController5.text.trim().length != 10 ||
                    _model.textController6.text.trim().isEmpty) {
                  return;
                }
                bool confirm = await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.bottomCenter,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: ComfirmTranferWidget(
                          accountNumber: '',
                          note: _model.textController7.text.trim(),
                          amount: RemoveThousandSeparator(_model
                                  .textController6.text
                                  .trim()
                                  .substring(1)
                                  .trim())
                              .toString(),
                          bankName: 'Abu Bank',
                          beneficiaryAccount:
                              _model.textController5.text.trim(),
                          beneficiaryName: '',
                        ),
                      ),
                    ) ??
                    false;

                if (confirm) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Color(0x00000000),
                    context: context,
                    builder: (bottomSheetContext) {
                      return Padding(
                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: ComfirmTranferSectionWidget(
                            accountNumber: '',
                            amount: RemoveThousandSeparator(_model
                                    .textController6.text
                                    .trim()
                                    .substring(1)
                                    .trim())
                                .toString(),
                            bankName: 'Abu Bank',
                            beneficiaryAccount:
                                _model.textController5.text.trim(),
                            beneficiaryName: '',
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              text: 'Comfirm',
              options: FFButtonOptions(
                width: 130.0,
                height: 55.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
    );
  }

  Widget _transferOtherBank() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _model.textController8,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Beneficiary Account Number',
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
                  keyboardType: TextInputType.number,
                  validator:
                      _model.textController8Validator.asValidator(context),
                ),
              ),
            ),
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
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _beneficiaryBankController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Beneficiary Bank',
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
                  validator:
                      _model.textController8Validator.asValidator(context),
                ),
              ),
            ),
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
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _beneficiaryNameController,
                  obscureText: false,
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
                  validator:
                      _model.textController8Validator.asValidator(context),
                ),
              ),
            ),
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
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _model.textController9,
                  obscureText: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsSeparatorInputFormatter(),
                    PrefixAdd('\u20A6'),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
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
                        fontFamily: 'Roboto',
                        color: AbuBankTheme.of(context).primaryText,
                      ),
                  keyboardType: TextInputType.number,
                  validator:
                      _model.textController9Validator.asValidator(context),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 10.0),
            child: Container(
              width: 332.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: Color(0x12000000),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: AbuBankTheme.of(context).orange,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _model.textController10,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Note',
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
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.textController10Validator.asValidator(context),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (_model.textController6.text.trim().isEmpty ||
                    _model.textController8.text.trim().length != 10 ||
                    _beneficiaryBankController.text.trim().isEmpty ||
                    _beneficiaryNameController.text.trim().isEmpty) {
                  return;
                }
                bool confirm = await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.bottomCenter,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: ComfirmTranferWidget(
                          accountNumber: '',
                          note: _model.textController7.text.trim(),
                          amount: _model.textController6.text.trim(),
                          bankName: _beneficiaryBankController.text.trim(),
                          beneficiaryAccount:
                              _model.textController8.text.trim(),
                          beneficiaryName:
                              _beneficiaryNameController.text.trim(),
                        ),
                      ),
                    ) ??
                    false;
                if (confirm) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Color(0x00000000),
                    context: context,
                    builder: (bottomSheetContext) {
                      return Padding(
                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: ComfirmTranferSectionWidget(
                            accountNumber: '',
                            amount: _model.textController6.text.trim(),
                            bankName: '',
                            beneficiaryAccount:
                                _model.textController8.text.trim(),
                            beneficiaryName: '',
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              text: 'Comfirm',
              options: FFButtonOptions(
                width: 130.0,
                height: 55.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
    );
  }
}
