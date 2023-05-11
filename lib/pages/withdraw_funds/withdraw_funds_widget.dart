import 'package:abu_bank/helper/account_container.dart';
import 'package:abu_bank/helper/thousand_separator.dart';
import 'package:abu_bank/models/bank_model.dart';
import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:abu_bank/providers/tab_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../components/choose_bank_section/choose_bank_section_widget.dart';
import '../../components/comfirm_tranfer_section/comfirm_tranfer_section_widget.dart';
import '../../helper/custom_loader.dart';
import '../../helper/prefix_add.dart';
import '../../requests/accounts.dart';
import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import '../../theme/abu_bank_widgets.dart';
import '../comfirm_tranfer/comfirm_tranfer_widget.dart';
import '../set_new_pin/set_new_pin.dart';
import '../transfer_funds/transfer_funds_widget.dart';
import '../transfer_suscessful/transfer_suscessful_widget.dart';
import 'withdraw_funds_model.dart';

export 'withdraw_funds_model.dart';

class WithdrawFundsWidget extends StatefulWidget {
  const WithdrawFundsWidget({Key? key}) : super(key: key);

  @override
  _WithdrawFundsWidgetState createState() => _WithdrawFundsWidgetState();
}

class _WithdrawFundsWidgetState extends State<WithdrawFundsWidget> {
  late WithdrawFundsModel _model;
  BankModel? selectedBank;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _beneficiaryNameController =
      TextEditingController();
  final TextEditingController _sortCodeController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _descriptionController2 = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WithdrawFundsModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
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
        body: Consumer<AccountDataProvider>(builder: (context, provider, _) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Withdraw Funds',
                            style: AbuBankTheme.of(context).headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AccountContainer(
                          amountControllers: [
                            _model.textController2!,
                            _amountController
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Choose transaction',
                                style: AbuBankTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: AbuBankTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      index = 0;
                                    });
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xFFF2F1F9),
                                            size: 32.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'Local \nWithdrawal',
                                              maxLines: 2,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = 1;
                                    });
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.account_balance_rounded,
                                            color: Color(0xFFF2F1F9),
                                            size: 30.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'International \nWithdrawal',
                                              maxLines: 2,
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: index == 0
                        ? _withdrawLocalBank(provider)
                        : _withdrawInternationBank(provider),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _withdrawLocalBank(AccountDataProvider provider) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20.0, 0.0, 0.0),
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
              margin: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      controller: _model.textController1,
                      obscureText: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 10,
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      controller: _model.textController2,
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {});
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ThousandsSeparatorInputFormatter(),
                        PrefixAdd(provider.selectedAccount?.currencySign ??
                            context
                                .read<AccountDataProvider>()
                                .accounts![0]
                                .currencySign),
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
                                    _model.textController2!, context)
                                ? AbuBankTheme.of(context).primaryText
                                : AbuBankTheme.of(context).error,
                          ),
                      keyboardType: TextInputType.number,
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                    child: TextFormField(
                      controller: _descriptionController,
                      obscureText: false,
                      minLines: 3,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Description',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 20.0),
            child: FFButtonWidget(
              onPressed: _model.textController1.text.trim().length < 10 ||
                      _model.textController2.text.trim().isEmpty ||
                      selectedBank == null ||
                      !isBalanceSufficient(_model.textController2!, context)
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
                          accountNumber: _model.textController1.text.trim());
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
                                isTransfer: false,
                                accountNumber:
                                    provider.selectedAccount!.accountNumber,
                                note: _descriptionController.text.trim(),
                                amount: RemoveThousandSeparator(_model
                                        .textController2.text
                                        .trim()
                                        .substring(1)
                                        .trim())
                                    .toString(),
                                bankName: selectedBank!.name,
                                beneficiaryAccount:
                                    _model.textController1.text.trim(),
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
                          isLocal: true,
                          amount: RemoveThousandSeparator(_model
                                  .textController2.text
                                  .trim()
                                  .substring(1)
                                  .trim())
                              .toString(),
                          bankName: selectedBank!.name,
                          beneficiaryAccount:
                              _model.textController1.text.trim(),
                          description: _descriptionController.text.trim(),
                        );
                      }
                    },
              text: 'Confirm',
              fingerprintLoading: loading,
              options: FFButtonOptions(
                width: double.infinity,
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
    required String amount,
    required String beneficiaryAccount,
    required String description,
    required bool isLocal,
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

        final withdrawResponse = isLocal
            ? await Accounts.localWithdraw(
                bankName: bankName,
                accountNumber: beneficiaryAccount,
                accountName: beneficiaryName,
                accountKey: provider.selectedAccount!.accountKey,
                amount: amount,
                description: description,
              )
            : await Accounts.internationalWithdraw(
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

        if (withdrawResponse['status']) {
          Provider.of<AccountDataProvider>(context, listen: false)
              .getAccountDetails();
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
                isTransfer: false,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                withdrawResponse['message'],
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
          description: description,
          bankName: bankName,
          isLocal: isLocal,
          swiftCode: swiftCode,
        );
      }
    }
  }

  Widget _withdrawInternationBank(AccountDataProvider provider) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      controller: _bankNameController,
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Bank Name',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      controller: _accountNumberController,
                      obscureText: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 10,
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      controller: _beneficiaryNameController,
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Account Name',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      controller: _sortCodeController,
                      obscureText: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      controller: _amountController,
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {});
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ThousandsSeparatorInputFormatter(),
                        PrefixAdd(provider.selectedAccount?.currencySign ??
                            context
                                .read<AccountDataProvider>()
                                .accounts![0]
                                .currencySign),
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
                            color:
                                isBalanceSufficient(_amountController, context)
                                    ? AbuBankTheme.of(context).primaryText
                                    : AbuBankTheme.of(context).error,
                          ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 20.0, 0.0),
                    child: TextFormField(
                      controller: _descriptionController2,
                      obscureText: false,
                      minLines: 3,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Description',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 20.0),
            child: FFButtonWidget(
              onPressed: _bankNameController.text.trim().isEmpty ||
                      _accountNumberController.text.trim().isEmpty ||
                      _sortCodeController.text.trim().isEmpty ||
                      _beneficiaryNameController.text.trim().isEmpty ||
                      _amountController.text.trim().isEmpty ||
                      !isBalanceSufficient(_amountController, context)
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
                                isTransfer: false,
                                accountNumber:
                                    provider.selectedAccount!.accountNumber,
                                note: _descriptionController2.text.trim(),
                                amount: RemoveThousandSeparator(
                                        _amountController.text
                                            .trim()
                                            .substring(1)
                                            .trim())
                                    .toString(),
                                bankName: _bankNameController.text.trim(),
                                beneficiaryAccount:
                                    _accountNumberController.text.trim(),
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
                          isLocal: false,
                          beneficiaryName:
                              _beneficiaryNameController.text.trim(),
                          amount: RemoveThousandSeparator(_amountController.text
                                  .trim()
                                  .substring(1)
                                  .trim())
                              .toString(),
                          bankName: _bankNameController.text.trim(),
                          beneficiaryAccount:
                              _accountNumberController.text.trim(),
                          description: _descriptionController2.text.trim(),
                          swiftCode: _sortCodeController.text.trim(),
                        );
                      }
                    },
              text: 'Confirm',
              fingerprintLoading: loading,
              options: FFButtonOptions(
                width: double.infinity,
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

showWarning(BuildContext context) async {
  var confirmDialogResponse = await showDialog<bool>(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Head\'s Up'),
            content: Text('Cancel this transaction'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext, true),
                child: Text('Confirm'),
              ),
            ],
          );
        },
      ) ??
      false;
  if (confirmDialogResponse) {
    if (Navigator.canPop(context))
      Navigator.pop(context);
    else {
      Provider.of<TabProvider>(context, listen: false).changeTab(0);
    }
  }
}
