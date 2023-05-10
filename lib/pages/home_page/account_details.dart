import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../theme/abu_bank_theme.dart';

class AccountSummaryWidget extends StatefulWidget {
  final String accountNumber;
  final double accountBalance;
  final int index;
  final int totalAccounts;
  const AccountSummaryWidget({
    Key? key,
    required this.accountNumber,
    required this.accountBalance,
    required this.index,
    required this.totalAccounts,
  }) : super(key: key);

  @override
  State<AccountSummaryWidget> createState() => _AccountSummaryWidgetState();
}

class _AccountSummaryWidgetState extends State<AccountSummaryWidget> {
  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // await Navigator.push(
          //   context,
          //   PageTransition(
          //     type: PageTransitionType.scale,
          //     alignment: Alignment.bottomCenter,
          //     duration: Duration(milliseconds: 300),
          //     reverseDuration: Duration(milliseconds: 300),
          //     child: AccountandcardWidget(),
          //   ),
          // );
        },
        child: Container(
          width: double.infinity,
          height: 221.0,
          decoration: BoxDecoration(
            color: AbuBankTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/card-bg.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Available balance',
                          style: AbuBankTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showBalance = !showBalance;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20.0),
                          padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                          child: Icon(
                            showBalance
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                            text: '\u20A6 ',
                            style: TextStyle(fontFamily: 'Roboto'),
                            children: [
                              TextSpan(
                                text: showBalance
                                    ? numberFormat.format(widget.accountBalance)
                                    : '********',
                              ),
                            ]),
                        style: AbuBankTheme.of(context).displaySmall.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                        child: Text(
                          '< Acc. ${widget.index + 1} of ${widget.totalAccounts} >',
                          style: AbuBankTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13.3,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Savings Account: ${widget.accountNumber}',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
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
    );
  }
}
