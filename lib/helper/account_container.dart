import 'package:abu_bank/helper/mask_string.dart';
import 'package:abu_bank/models/account_model.dart';
import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/choose_accoun_section/choose_accoun_section_widget.dart';
import '../main.dart';
import '../theme/abu_bank_theme.dart';

class AccountContainer extends StatefulWidget {
  final List<TextEditingController>? amountControllers;
  const AccountContainer({this.amountControllers, Key? key}) : super(key: key);

  @override
  State<AccountContainer> createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  late AccountDataProvider accountDataProvider;

  @override
  void initState() {
    accountDataProvider =
        Provider.of<AccountDataProvider>(context, listen: false);

    accountDataProvider.changeSelectedAccount(accountDataProvider.accounts![0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountDataProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              AccountModel? accountModel = await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Color(0x00000000),
                context: context,
                builder: (bottomSheetContext) {
                  return Padding(
                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: ChooseAccounSectionWidget(),
                    ),
                  );
                },
              );

              if (accountModel == null) return;
              accountDataProvider.changeSelectedAccount(accountModel);
              if (widget.amountControllers != null) {
                widget.amountControllers!.forEach((element) {
                  element.text = '';
                });
              }
            },
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maskString(value.selectedAccount!.accountNumber,
                              visibleDigits: 5),
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: AbuBankTheme.of(context).primaryText,
                              ),
                        ),
                        Text(
                          'Available balance: ${value.selectedAccount!.currencySign} ${numberFormat.format(double.parse(value.selectedAccount!.balance))}',
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Roboto',
                                color: AbuBankTheme.of(context).orange,
                                fontSize: 12.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Text(
                          '${value.selectedAccount!.currencySign}',
                          style: AbuBankTheme.of(context).bodyMedium.override(
                                fontFamily: 'Roboto',
                                color: AbuBankTheme.of(context).primaryText,
                                fontSize: 26,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
