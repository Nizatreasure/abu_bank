import 'package:abu_bank/main.dart';
import 'package:abu_bank/models/transaction_history_model.dart';
import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import 'transactionreport_model.dart';

export 'transactionreport_model.dart';

class TransactionreportWidget extends StatefulWidget {
  const TransactionreportWidget({Key? key}) : super(key: key);

  @override
  _TransactionreportWidgetState createState() =>
      _TransactionreportWidgetState();
}

class _TransactionreportWidgetState extends State<TransactionreportWidget> {
  late TransactionreportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionreportModel());
    Provider.of<AccountDataProvider>(context, listen: false)
        .getTransactionHistory();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AbuBankTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
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
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AbuBankTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Transaction report',
                      style: AbuBankTheme.of(context).headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<AccountDataProvider>(
                builder: (context, accountDataProvider, child) {
                  if (accountDataProvider.loadingHistory) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (accountDataProvider.historyHasError ||
                      accountDataProvider.transactionHistory == null) {
                    return Center(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              AbuBankTheme.of(context).primary),
                        ),
                        onPressed: () {
                          Provider.of<AccountDataProvider>(context,
                                  listen: false)
                              .getTransactionHistory();
                        },
                        child: Text(
                          'Retry',
                          style: AbuBankTheme.of(context).bodySmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    );
                  }
                  if (accountDataProvider.transactionHistory!.isEmpty) {
                    return Center(
                      child: Text(
                        'No history',
                        style: AbuBankTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: AbuBankTheme.of(context).primaryText,
                              fontSize: 16,
                            ),
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      Provider.of<AccountDataProvider>(context, listen: false)
                          .getTransactionHistory();
                    },
                    child: ListView.builder(
                        itemCount:
                            accountDataProvider.transactionHistory!.length,
                        padding:
                            EdgeInsets.only(bottom: 20, left: 10, right: 10),
                        itemBuilder: (context, index) {
                          TransactionHistoryModel history =
                              accountDataProvider.transactionHistory![index];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 30.0,
                                    color: Color(0x123629B7),
                                    offset: Offset(0.0, 4.0),
                                    spreadRadius: 30.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          history.descType,
                                          style: AbuBankTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF0C0F10),
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Status:',
                                              style: AbuBankTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFA8A8A8),
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                history.status == '1'
                                                    ? 'Completed'
                                                    : 'Processing',
                                                style: AbuBankTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          history.status == '1'
                                                              ? AbuBankTheme.of(
                                                                      context)
                                                                  .primary
                                                              : AbuBankTheme.of(
                                                                      context)
                                                                  .green,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Type:',
                                                style: AbuBankTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFFA8A8A8),
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  history.type,
                                                  style:
                                                      AbuBankTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: history
                                                                        .type ==
                                                                    'debit'
                                                                ? AbuBankTheme.of(
                                                                        context)
                                                                    .error
                                                                : AbuBankTheme.of(
                                                                        context)
                                                                    .green,
                                                          ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          history.date,
                                          style: AbuBankTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFA8A8A8),
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Amount',
                                              style: AbuBankTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFA8A8A8),
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '${history.currencySign} ${numberFormat.format(double.parse(history.amount))}',
                                                style: AbuBankTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color: history.type ==
                                                              'debit'
                                                          ? AbuBankTheme.of(
                                                                  context)
                                                              .error
                                                          : AbuBankTheme.of(
                                                                  context)
                                                              .primary,
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
                          );
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
