import '../../theme/aza_bank_theme.dart';
import '../../theme/aza_bank_util.dart';
import 'package:flutter/material.dart';
import 'choose_bank_section_model.dart';
export 'choose_bank_section_model.dart';

class ChooseBankSectionWidget extends StatefulWidget {
  const ChooseBankSectionWidget({Key? key}) : super(key: key);

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
                          'Choose beneficiary bank',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'GT Bank',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'First Bank',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Chase Bank',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Wells Fago',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Fifth Third',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Bank of the West',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'JP Morgan Chae',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'US bank',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'HSBS bank',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Citybank',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ame Express',
                        style: AbuBankTheme.of(context).titleSmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
