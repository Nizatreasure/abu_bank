import 'package:abu_bank/helper/custom_loader.dart';
import 'package:abu_bank/models/bank_model.dart';
import 'package:abu_bank/pages/set_new_pin/set_new_pin.dart';
import 'package:abu_bank/requests/accounts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/pages/comfirm_tranfer/comfirm_tranfer_widget.dart';
import '../../components/choose_bank_section/choose_bank_section_widget.dart';
import '../../components/comfirm_tranfer_section/comfirm_tranfer_section_widget.dart';
import '../../helper/account_container.dart';
import '../../helper/prefix_add.dart';
import '../../helper/thousand_separator.dart';
import '../../providers/account_data_provider.dart';
import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import '../../theme/abu_bank_widgets.dart';
import '../transfer_suscessful/transfer_suscessful_widget.dart';
import '../withdraw_funds/withdraw_funds_widget.dart';
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
  final TextEditingController _swiftCodeController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  BankModel? selectedBank;
  bool loading = false;
  late AccountDataProvider notListeningProvider;

  @override
  void initState() {
    super.initState();
    notListeningProvider =
        Provider.of<AccountDataProvider>(context, listen: false);
    if (notListeningProvider.banks == null) {
      notListeningProvider.getBanks();
    }
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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return showWarning(context);
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AbuBankTheme.of(context).secondaryBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
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
                          showWarning(context);
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
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return Consumer<AccountDataProvider>(
                        builder: (context, accountDataProvider, child) {
                          return accountDataProvider.loadingBanks
                              ? Center(child: CircularProgressIndicator())
                              : accountDataProvider.banks == null
                                  ? Center(
                                      child: TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    AbuBankTheme.of(context)
                                                        .primary),
                                          ),
                                          onPressed: () {
                                            Provider.of<AccountDataProvider>(
                                                    context,
                                                    listen: false)
                                                .getBanks();
                                          },
                                          child: Text(
                                            'Retry',
                                            style: AbuBankTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      AbuBankTheme.of(context)
                                                          .primaryText,
                                                  fontSize: 16,
                                                ),
                                          )),
                                    )
                                  : SingleChildScrollView(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            minHeight: constraint.maxHeight),
                                        child: IntrinsicHeight(
                                          child: Column(
                                            children: [
                                              AccountContainer(
                                                amountControllers: [
                                                  _model.textController6!,
                                                  _model.textController9!
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Choose transaction',
                                                      style:
                                                          AbuBankTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: AbuBankTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 20.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            index = 0;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: index == 0
                                                                ? AbuBankTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Color(
                                                                    0x96777777),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons.person,
                                                                  color: Color(
                                                                      0xFFF2F1F9),
                                                                  size: 32.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    'Local \nTransfer',
                                                                    maxLines: 2,
                                                                    style: AbuBankTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFFE0E0E0),
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            index = 1;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: index == 1
                                                                ? AbuBankTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Color(
                                                                    0x96777777),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .account_balance_rounded,
                                                                  color: Color(
                                                                      0xFFF2F1F9),
                                                                  size: 30.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    'International \nTransfer',
                                                                    maxLines: 2,
                                                                    style: AbuBankTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFFE0E0E0),
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
                                              Builder(
                                                builder: (context) {
                                                  return index == 0
                                                      ? _transferLocalBank(
                                                          accountDataProvider)
                                                      : _transferInternationalBank(
                                                          accountDataProvider);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _transferLocalBank(AccountDataProvider provider) {
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
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  BankModel? bank = await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Color(0x00000000),
                    context: context,
                    builder: (bottomSheetContext) {
                      return Padding(
                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: ChooseBankSectionWidget(selectedBank),
                        ),
                      );
                    },
                  );

                  if (bank == null) return;
                  setState(() {
                    selectedBank = bank;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedBank == null
                                ? 'Choose Bank'
                                : selectedBank!.name,
                            style: AbuBankTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  color: AbuBankTheme.of(context).primaryText,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Icon(
                            Icons.account_balance_rounded,
                            color: AbuBankTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                    PrefixAdd(provider.selectedAccount?.currencySign ??
                        provider.accounts![0].currencySign),
                  ],
                  onChanged: (value) {
                    setState(() {});
                  },
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
                        color: isBalanceSufficient(
                                _model.textController6!, context)
                            ? AbuBankTheme.of(context).primaryText
                            : AbuBankTheme.of(context).error,
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
              fingerprintLoading: loading,
              onPressed: _model.textController5.text.trim().length != 10 ||
                      _model.textController6.text.trim().isEmpty ||
                      selectedBank == null ||
                      !isBalanceSufficient(_model.textController6!, context)
                  ? null
                  : () async {
                      if (!provider.hasSetPin) {
                        setPin(context);

                        return;
                      }
                      String beneficiaryName = '';
                      CustomOverlay.showOverlay(context);
                      final responseData = await Accounts.getBeneficiary(
                          bankCode: selectedBank!.code,
                          accountNumber: _model.textController5.text.trim());
                      CustomOverlay.dismissOverlay();
                      if (!responseData['status']) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              responseData['message'],
                              style: AbuBankTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: AbuBankTheme.of(context).primary3,
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: AbuBankTheme.of(context).error,
                          ),
                        );
                        return;
                      }
                      beneficiaryName = responseData['data'];

                      bool confirm = await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: ComfirmTranferWidget(
                                accountNumber:
                                    provider.selectedAccount!.accountNumber,
                                note: _model.textController7.text.trim(),
                                amount: RemoveThousandSeparator(_model
                                        .textController6.text
                                        .trim()
                                        .substring(1)
                                        .trim())
                                    .toString(),
                                bankName: selectedBank!.name,
                                beneficiaryAccount:
                                    _model.textController5.text.trim(),
                                beneficiaryName: beneficiaryName,
                                currencySign:
                                    provider.selectedAccount!.currencySign,
                              ),
                            ),
                          ) ??
                          false;

                      if (confirm) {
                        enterPin(
                          provider: provider,
                          beneficiaryName: beneficiaryName,
                          amount: RemoveThousandSeparator(_model
                                  .textController6.text
                                  .trim()
                                  .substring(1)
                                  .trim())
                              .toString(),
                          isLocal: true,
                          bankName: selectedBank!.name,
                          beneficiaryAccount:
                              _model.textController5.text.trim(),
                          description: _model.textController7.text.trim(),
                        );
                      }
                    },
              text: 'Confirm',
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

  enterPin({
    required AccountDataProvider provider,
    required String beneficiaryName,
    required bool isLocal,
    required String amount,
    required String beneficiaryAccount,
    required String description,
    required String bankName,
    String? swiftCode,
  }) async {
    String? pin = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Color(0x00000000),
      context: context,
      builder: (bottomSheetContext) {
        return Padding(
          padding: MediaQuery.of(bottomSheetContext).viewInsets,
          child: Container(
            child: ComfirmTranferSectionWidget(
              accountNumber: provider.selectedAccount!.accountNumber,
              amount: amount,
              bankName: bankName,
              beneficiaryAccount: beneficiaryAccount,
              beneficiaryName: beneficiaryName,
              currencySign: provider.selectedAccount!.currencySign,
            ),
          ),
        );
      },
    );

    if (pin != null) {
      CustomOverlay.showOverlay(context);
      setState(() {
        loading = true;
      });
      final response = await Accounts.verifyPin(pin);
      CustomOverlay.dismissOverlay();
      setState(() {
        loading = false;
      });
      await Future.delayed(const Duration(milliseconds: 1));
      if (response['status']) {
        CustomOverlay.showOverlay(context);
        setState(() {
          loading = true;
        });

        final transferResponse = isLocal
            ? await Accounts.localTransfer(
                bankName: bankName,
                accountNumber: beneficiaryAccount,
                accountName: beneficiaryName,
                accountKey: provider.selectedAccount!.accountKey,
                amount: amount,
                description: description,
              )
            : await Accounts.internationalTransfer(
                bankName: bankName,
                accountNumber: beneficiaryAccount,
                accountName: beneficiaryName,
                accountKey: provider.selectedAccount!.accountKey,
                amount: amount,
                description: description,
                swiftCode: swiftCode!,
              );
        setState(() {
          loading = false;
        });
        CustomOverlay.dismissOverlay();

        if (transferResponse['status']) {
          notListeningProvider.getAccountDetails();
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.scale,
              alignment: Alignment.bottomCenter,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: TransferSuscessfulWidget(
                amount: amount,
                beneficiaryName: beneficiaryName,
                currencySign: provider.selectedAccount!.currencySign,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                transferResponse['message'],
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
        await Future.delayed(const Duration(milliseconds: 1000));
        enterPin(
          provider: provider,
          beneficiaryName: beneficiaryName,
          beneficiaryAccount: beneficiaryAccount,
          amount: amount,
          isLocal: isLocal,
          swiftCode: swiftCode,
          description: description,
          bankName: bankName,
        );
      }
    }
  }

  Widget _transferInternationalBank(AccountDataProvider provider) {
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
                  onChanged: (value) {
                    setState(() {});
                  },
                  textCapitalization: TextCapitalization.words,
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
                  controller: _swiftCodeController,
                  obscureText: false,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'Swift Code',
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
                  onChanged: (value) {
                    setState(() {});
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsSeparatorInputFormatter(),
                    PrefixAdd(provider.selectedAccount?.currencySign ??
                        provider.accounts![0].currencySign),
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
                        color: isBalanceSufficient(
                                _model.textController9!, context)
                            ? AbuBankTheme.of(context).primaryText
                            : AbuBankTheme.of(context).error,
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
              fingerprintLoading: loading,
              onPressed: _model.textController8.text.trim().isEmpty ||
                      _model.textController9.text.trim().isEmpty ||
                      _beneficiaryBankController.text.trim().isEmpty ||
                      _beneficiaryNameController.text.trim().isEmpty ||
                      _swiftCodeController.text.trim().isEmpty ||
                      !isBalanceSufficient(_model.textController9!, context)
                  ? null
                  : () async {
                      if (!provider.hasSetPin) {
                        setPin(context);

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
                                accountNumber:
                                    provider.selectedAccount!.accountNumber,
                                note: _model.textController10.text.trim(),
                                amount: RemoveThousandSeparator(_model
                                        .textController9.text
                                        .trim()
                                        .substring(1)
                                        .trim())
                                    .toString(),
                                bankName:
                                    _beneficiaryBankController.text.trim(),
                                beneficiaryAccount:
                                    _model.textController8.text.trim(),
                                beneficiaryName:
                                    _beneficiaryNameController.text.trim(),
                                currencySign:
                                    provider.selectedAccount!.currencySign,
                              ),
                            ),
                          ) ??
                          false;
                      if (confirm) {
                        enterPin(
                          provider: provider,
                          beneficiaryName:
                              _beneficiaryNameController.text.trim(),
                          description: _model.textController10.text.trim(),
                          beneficiaryAccount:
                              _model.textController8.text.trim(),
                          swiftCode: _swiftCodeController.text.trim(),
                          isLocal: false,
                          bankName: _beneficiaryBankController.text.trim(),
                          amount: RemoveThousandSeparator(_model
                                  .textController9.text
                                  .trim()
                                  .substring(1)
                                  .trim())
                              .toString(),
                        );
                      }
                    },
              text: 'Confirm',
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

bool isBalanceSufficient(
    TextEditingController controller, BuildContext context) {
  AccountDataProvider provider =
      Provider.of<AccountDataProvider>(context, listen: false);
  return double.parse(
          provider.selectedAccount?.balance ?? provider.accounts![0].balance) >=
      double.parse(RemoveThousandSeparator(controller.text.trim().length > 1
              ? controller.text.trim().substring(1).trim().toString()
              : '0')
          .toString());
}
