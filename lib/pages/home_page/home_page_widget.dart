import 'package:abu_bank/helper/constants.dart';
import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/pages/transactionreport/transactionreport_widget.dart';
import '../../helper/mask_string.dart';
import '../../providers/tab_provider.dart';
import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import 'account_details.dart';
import 'home_page_model.dart';

export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool showBalance = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
      backgroundColor: AbuBankTheme.of(context).primary,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AbuBankTheme.of(context).primary,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Provider.of<TabProvider>(context, listen: false)
                                    .changeTab(3);
                              },
                              child: Container(
                                width: 35.0,
                                height: 35.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Avatar.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Hi, ${userData?.firstName ?? ''} ${userData?.lastName ?? ''}',
                                style: AbuBankTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: AbuBankTheme.of(context).primary3,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AbuBankTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Consumer<AccountDataProvider>(
                builder: (context, accounts, child) {
                  return accounts.accounts == null && accounts.loadingDetails
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : accounts.accounts == null && !accounts.loadingDetails
                          ? Center(
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AbuBankTheme.of(context).primary),
                                  ),
                                  onPressed: () {
                                    Provider.of<AccountDataProvider>(context,
                                            listen: false)
                                        .getAccountDetails();
                                  },
                                  child: Text(
                                    'Retry',
                                    style: AbuBankTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: AbuBankTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                        ),
                                  )),
                            )
                          : RefreshIndicator(
                              onRefresh: () async {
                                await Provider.of<AccountDataProvider>(context,
                                        listen: false)
                                    .getAccountDetails();
                              },
                              child: SingleChildScrollView(
                                primary: false,
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CarouselSlider(
                                      items: List.generate(
                                          accounts.accounts!.length,
                                          (index) => index).map(
                                        (i) {
                                          return AccountSummaryWidget(
                                            accountBalance: double.parse(
                                                accounts.accounts![i].balance),
                                            accountNumber: maskString(
                                              accounts
                                                  .accounts![i].accountNumber,
                                              visibleDigits: 5,
                                            ),
                                            index: i,
                                            totalAccounts:
                                                accounts.accounts!.length,
                                            currencySign: accounts
                                                .accounts![i].currencySign,
                                          );
                                        },
                                      ).toList(),
                                      options: CarouselOptions(
                                        enableInfiniteScroll: false,
                                        clipBehavior: Clip.none,
                                        height: 270,
                                        viewportFraction: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              Provider.of<TabProvider>(context,
                                                      listen: false)
                                                  .changeTab(1);
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 30.0,
                                                    color: Color(0x123629B7),
                                                    offset: Offset(0.0, -5.0),
                                                    spreadRadius: 30.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/tranfer-icon.svg',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                  Text(
                                                    'Transfer',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        AbuBankTheme.of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: AbuBankTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              Provider.of<TabProvider>(context,
                                                      listen: false)
                                                  .changeTab(2);
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 30.0,
                                                    color: Color(0x123629B7),
                                                    offset: Offset(0.0, -5.0),
                                                    spreadRadius: 30.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/withdraw-icon.svg',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                  Text(
                                                    'Withdraw',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        AbuBankTheme.of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: AbuBankTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {},
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 30.0,
                                                    color: Color(0x123629B7),
                                                    offset: Offset(0.0, -5.0),
                                                    spreadRadius: 30.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/pig_1.svg',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                  Text(
                                                    'Deposit',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        AbuBankTheme.of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: AbuBankTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type:
                                                      PageTransitionType.scale,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child:
                                                      TransactionreportWidget(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 30.0,
                                                    color: Color(0x123629B7),
                                                    offset: Offset(0.0, -5.0),
                                                    spreadRadius: 30.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/repprt-icon.svg',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                  Text(
                                                    'Transaction\nhistory',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        AbuBankTheme.of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: AbuBankTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                  ),
                                                ],
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
