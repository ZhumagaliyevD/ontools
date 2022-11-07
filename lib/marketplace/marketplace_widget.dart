import '../backend/backend.dart';
import '../components/filter_widget.dart';
import '../components/sort_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketplaceWidget extends StatefulWidget {
  const MarketplaceWidget({Key? key}) : super(key: key);

  @override
  _MarketplaceWidgetState createState() => _MarketplaceWidgetState();
}

class _MarketplaceWidgetState extends State<MarketplaceWidget> {
  TextEditingController? marketSearchController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    marketSearchController = TextEditingController();
  }

  @override
  void dispose() {
    marketSearchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed('AddNewToolPage');

          setState(() => FFAppState().SearchList = false);
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 36,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 20,
          borderWidth: 1,
          buttonSize: 40,
          icon: Icon(
            FFIcons.kfreeIconFontComment3916603,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20,
          ),
          onPressed: () async {
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed('AllChats');
          },
        ),
        title: Text(
          'Маркетплэйс',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20,
            borderWidth: 1,
            buttonSize: 40,
            icon: Icon(
              FFIcons.kfreeIconFontSettingsSliders3917103,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20,
            ),
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: FilterWidget(),
                  );
                },
              ).then((value) => setState(() {}));
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              icon: Icon(
                FFIcons.ksortAmountUp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 20,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SortWidget(),
                    );
                  },
                ).then((value) => setState(() {}));
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: marketSearchController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'marketSearchController',
                                        Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Поиск',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .lineColor,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 50,
                                    icon: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        marketSearchController?.clear();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (FFAppState().sortBy == null || FFAppState().sortBy == '')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: StreamBuilder<List<ToolsRecord>>(
                      stream: queryToolsRecord(
                        queryBuilder: (toolsRecord) => toolsRecord
                            .where('ShopName',
                                isEqualTo: FFAppState().filterShopName != ''
                                    ? FFAppState().filterShopName
                                    : null)
                            .where('is_cheque',
                                isEqualTo: FFAppState().isCheque != ''
                                    ? FFAppState().isCheque
                                    : null)
                            .where('inSale', isEqualTo: true)
                            .where('ToolName',
                                isEqualTo: FFAppState().MarketplaceSearch != ''
                                    ? FFAppState().MarketplaceSearch
                                    : null),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                            ),
                          );
                        }
                        List<ToolsRecord> fullListToolsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: fullListToolsRecordList.length,
                          itemBuilder: (context, fullListIndex) {
                            final fullListToolsRecord =
                                fullListToolsRecordList[fullListIndex];
                            return Visibility(
                              visible: functions.searchRealTimeCopy(
                                  marketSearchController!.text,
                                  fullListToolsRecord.toolName!),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      setState(() => FFAppState().toolBuyDate =
                                          fullListToolsRecord.buyDate);
                                      setState(() => FFAppState().toolimg =
                                          fullListToolsRecord.photo!);

                                      context.pushNamed(
                                        'ToolDetailPage',
                                        queryParams: {
                                          'tool': serializeParam(
                                            fullListToolsRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'tool': fullListToolsRecord,
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            fullListToolsRecord.photo!,
                                            width: 80,
                                            height: 116,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  fullListToolsRecord.toolName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 12),
                                                  child: Text(
                                                    fullListToolsRecord
                                                        .description!,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${fullListToolsRecord.price?.toString()} \$',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Container(
                                                      width: 1,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                          'd/M/y',
                                                          fullListToolsRecord
                                                              .buyDate!),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Container(
                                                      width: 1,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      fullListToolsRecord
                                                          .shopName!,
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 25,
                                    thickness: 1,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (FFAppState().sortBy == 'by date')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: StreamBuilder<List<ToolsRecord>>(
                      stream: queryToolsRecord(
                        queryBuilder: (toolsRecord) => toolsRecord
                            .where('inSale', isEqualTo: true)
                            .orderBy('Price', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                            ),
                          );
                        }
                        List<ToolsRecord> byDateToolsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: byDateToolsRecordList.length,
                          itemBuilder: (context, byDateIndex) {
                            final byDateToolsRecord =
                                byDateToolsRecordList[byDateIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() => FFAppState().toolBuyDate =
                                        byDateToolsRecord.buyDate);
                                    setState(() => FFAppState().toolimg =
                                        byDateToolsRecord.photo!);

                                    context.pushNamed(
                                      'ToolDetailPage',
                                      queryParams: {
                                        'tool': serializeParam(
                                          byDateToolsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'tool': byDateToolsRecord,
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          byDateToolsRecord.photo!,
                                          width: 80,
                                          height: 116,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                byDateToolsRecord.toolName!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 12),
                                                child: Text(
                                                  byDateToolsRecord
                                                      .description!,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${byDateToolsRecord.price?.toString()} \$',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                        'd/M/y',
                                                        byDateToolsRecord
                                                            .buyDate!),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  Text(
                                                    byDateToolsRecord.shopName!,
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 25,
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (FFAppState().sortBy == 'by price')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: StreamBuilder<List<ToolsRecord>>(
                      stream: queryToolsRecord(
                        queryBuilder: (toolsRecord) => toolsRecord
                            .where('inSale', isEqualTo: true)
                            .orderBy('created_at', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                            ),
                          );
                        }
                        List<ToolsRecord> byPriceToolsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: byPriceToolsRecordList.length,
                          itemBuilder: (context, byPriceIndex) {
                            final byPriceToolsRecord =
                                byPriceToolsRecordList[byPriceIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() => FFAppState().toolBuyDate =
                                        byPriceToolsRecord.buyDate);
                                    setState(() => FFAppState().toolimg =
                                        byPriceToolsRecord.photo!);

                                    context.pushNamed(
                                      'ToolDetailPage',
                                      queryParams: {
                                        'tool': serializeParam(
                                          byPriceToolsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'tool': byPriceToolsRecord,
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          byPriceToolsRecord.photo!,
                                          width: 80,
                                          height: 116,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                byPriceToolsRecord.toolName!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 12),
                                                child: Text(
                                                  byPriceToolsRecord
                                                      .description!,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${byPriceToolsRecord.price?.toString()} \$',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                        'd/M/y',
                                                        byPriceToolsRecord
                                                            .buyDate!),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  Text(
                                                    byPriceToolsRecord
                                                        .shopName!,
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 25,
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (FFAppState().sortBy == 'by newest')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: StreamBuilder<List<ToolsRecord>>(
                      stream: queryToolsRecord(
                        queryBuilder: (toolsRecord) => toolsRecord
                            .where('inSale', isEqualTo: true)
                            .orderBy('created_at', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                            ),
                          );
                        }
                        List<ToolsRecord> byNewestToolsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: byNewestToolsRecordList.length,
                          itemBuilder: (context, byNewestIndex) {
                            final byNewestToolsRecord =
                                byNewestToolsRecordList[byNewestIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() => FFAppState().toolBuyDate =
                                        byNewestToolsRecord.buyDate);
                                    setState(() => FFAppState().toolimg =
                                        byNewestToolsRecord.photo!);

                                    context.pushNamed(
                                      'ToolDetailPage',
                                      queryParams: {
                                        'tool': serializeParam(
                                          byNewestToolsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'tool': byNewestToolsRecord,
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          byNewestToolsRecord.photo!,
                                          width: 80,
                                          height: 116,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                byNewestToolsRecord.toolName!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 12),
                                                child: Text(
                                                  byNewestToolsRecord
                                                      .description!,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${byNewestToolsRecord.price?.toString()} \$',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                        'd/M/y',
                                                        byNewestToolsRecord
                                                            .buyDate!),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  Text(
                                                    byNewestToolsRecord
                                                        .shopName!,
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 25,
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                ),
                              ],
                            );
                          },
                        );
                      },
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
