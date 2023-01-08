import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String? chequeValue;
  String? shopNameValue;
  String? toolNameValue;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ToolsRecord>>(
      stream: queryToolsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
            ),
          );
        }
        List<ToolsRecord> bottomSheetMaterialToolsRecordList = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                        child: Container(
                          width: 48,
                          height: 2,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 12),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'a8gtujkn' /* Фильтры */,
                        ),
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                      child: FlutterFlowDropDown<String>(
                        options: bottomSheetMaterialToolsRecordList
                            .where((e) => e.inSale!)
                            .toList()
                            .map((e) => e.toolName)
                            .withoutNulls
                            .toList()
                            .toList(),
                        onChanged: (val) => setState(() => toolNameValue = val),
                        width: double.infinity,
                        height: 50,
                        textStyle: FlutterFlowTheme.of(context).bodyText1,
                        hintText: FFLocalizations.of(context).getText(
                          'j76bwclh' /* Название инструмента */,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 12,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                      child: FlutterFlowDropDown<String>(
                        options: bottomSheetMaterialToolsRecordList
                            .where((e) => e.inSale!)
                            .toList()
                            .map((e) => e.shopName)
                            .withoutNulls
                            .toList()
                            .toList(),
                        onChanged: (val) => setState(() => shopNameValue = val),
                        width: double.infinity,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'ut388fjt' /* Название магазина */,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 12,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                      child: FlutterFlowDropDown<String>(
                        options: [
                          FFLocalizations.of(context).getText(
                            '7e6e4a7j' /* Есть */,
                          ),
                          FFLocalizations.of(context).getText(
                            '8mzey73b' /* Нет */,
                          )
                        ],
                        onChanged: (val) => setState(() => chequeValue = val),
                        width: double.infinity,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'j5nps9d4' /* Наличие чека */,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 12,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        offset: Offset(0, -1),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          if (toolNameValue != null && toolNameValue != '') {
                            FFAppState().update(() {
                              FFAppState().MarketplaceSearch = toolNameValue!;
                            });
                          }
                          if (shopNameValue != null && shopNameValue != '') {
                            FFAppState().update(() {
                              FFAppState().filterShopName = shopNameValue!;
                            });
                          }
                          if (chequeValue != null && chequeValue != '') {
                            FFAppState().update(() {
                              FFAppState().isCheque = chequeValue!;
                            });
                          }
                          Navigator.pop(context);
                          FFAppState().update(() {
                            FFAppState().sortBy = '';
                          });

                          context.pushNamed(
                            'Marketplace',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '07sb0wk2' /* Применить */,
                        ),
                        options: FFButtonOptions(
                          width: 343,
                          height: 48,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
