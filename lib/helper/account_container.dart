import 'package:flutter/material.dart';

import '../components/choose_accoun_section/choose_accoun_section_widget.dart';
import '../main.dart';
import '../theme/aza_bank_theme.dart';

class AccountContainer extends StatelessWidget {
  const AccountContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x00000000),
            context: context,
            builder: (bottomSheetContext) {
              return GestureDetector(
                child: Padding(
                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ChooseAccounSectionWidget(),
                  ),
                ),
              );
            },
          );
          // .then((value) => setState(() {}));
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
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0209849421',
                      style: AbuBankTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: AbuBankTheme.of(context).primaryText,
                          ),
                    ),
                    Text(
                      'Available balance: \u20A6 ${numberFormat.format(1000.90)}',
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
                      '\u20A6',
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
  }
}
