import 'package:abu_bank/main.dart';
import 'package:flutter/material.dart';

import '../../theme/abu_bank_theme.dart';
import '../../theme/abu_bank_util.dart';
import 'choose_accoun_section_model.dart';

export 'choose_accoun_section_model.dart';

class ChooseAccounSectionWidget extends StatefulWidget {
  const ChooseAccounSectionWidget({Key? key}) : super(key: key);

  @override
  _ChooseAccounSectionWidgetState createState() =>
      _ChooseAccounSectionWidgetState();
}

class _ChooseAccounSectionWidgetState extends State<ChooseAccounSectionWidget> {
  late ChooseAccounSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseAccounSectionModel());
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Choose Account',
                          style: AbuBankTheme.of(context).titleSmall,
                        ),
                      ],
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) => index).map(
                  (e) {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
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
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Account ${e + 1}',
                                            style: AbuBankTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0C0F10),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '0209849421',
                                            style: AbuBankTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0C0F10),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Avalable balance',
                                            style: AbuBankTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0C0F10),
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '\u20A6 ${numberFormat.format(2000.98)}',
                                            style: AbuBankTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color:
                                                      AbuBankTheme.of(context)
                                                          .primary,
                                                  fontWeight: FontWeight.bold,
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
                        ),
                      ),
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
