import 'package:abu_bank/models/bank_model.dart';
import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import 'choose_bank_section_model.dart';

export 'choose_bank_section_model.dart';

class ChooseBankSectionWidget extends StatefulWidget {
  final BankModel? selectedBank;
  const ChooseBankSectionWidget(this.selectedBank, {Key? key})
      : super(key: key);

  @override
  _ChooseBankSectionWidgetState createState() =>
      _ChooseBankSectionWidgetState();
}

class _ChooseBankSectionWidgetState extends State<ChooseBankSectionWidget> {
  late ChooseBankSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => ChooseBankSectionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.0,
      decoration: BoxDecoration(
        color: AbuBankTheme.of(context).secondaryBackground,
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
      child: Consumer<AccountDataProvider>(
        builder: (context, accountDataProvider, child) {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Choose beneficiary bank',
                          style: AbuBankTheme.of(context).titleSmall.override(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(accountDataProvider.banks!.length,
                          (index) => index).map((e) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(
                                context, accountDataProvider.banks![e]);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: double.infinity,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                child: Text(
                                  accountDataProvider.banks![e].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: AbuBankTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: widget.selectedBank != null &&
                                                widget.selectedBank!.name ==
                                                    accountDataProvider
                                                        .banks![e].name
                                            ? 17
                                            : 16,
                                        fontWeight:
                                            widget.selectedBank != null &&
                                                    widget.selectedBank!.name ==
                                                        accountDataProvider
                                                            .banks![e].name
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                ),
                              ),
                              Divider(
                                indent: 20.0,
                                endIndent: 20.0,
                                height: 0,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
