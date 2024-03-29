import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/report_del_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHomePageWidget extends StatefulWidget {
  const ProfileHomePageWidget({Key? key}) : super(key: key);

  @override
  _ProfileHomePageWidgetState createState() => _ProfileHomePageWidgetState();
}

class _ProfileHomePageWidgetState extends State<ProfileHomePageWidget> {
  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(
        singleRecord: true,
      ),
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
        List<UserRecord> profileHomePageUserRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final profileHomePageUserRecord =
            profileHomePageUserRecordList.isNotEmpty
                ? profileHomePageUserRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          drawer: Container(
            width: double.infinity,
            child: Drawer(
              elevation: 16,
              child: Align(
                alignment: AlignmentDirectional(0, -0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 25,
                            ),
                            onPressed: () async {
                              if (scaffoldKey.currentState!.isDrawerOpen ||
                                  scaffoldKey.currentState!.isEndDrawerOpen) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Настройки',
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Text(
                        'Общие настройки',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: SwitchListTile(
                        value: switchListTileValue ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue = newValue),
                        title: Text(
                          'Уведомления',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Политика конфиденциальности данных',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                    ListTile(
                      title: Text(
                        'Задать вопрос',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                    ListTile(
                      title: Text(
                        'О приложении',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'Главная страница',
              style: FlutterFlowTheme.of(context).subtitle1,
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  FFIcons.kfreeIconFontSettings3917058,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
                onPressed: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
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
                      width: MediaQuery.of(context).size.width,
                      height: 132,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AuthUserStreamWidget(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/on-tools-afj9b2/assets/e7eohoj7hn57/uploadImg.png',
                                  ),
                                  width: 80,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 20, 0, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Добро пожаловать,',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                    AuthUserStreamWidget(
                                      child: Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () async {
                                        setState(() => FFAppState().birthday =
                                            currentUserDocument!.birthday);
                                        setState(() => FFAppState().address =
                                            currentUserDocument!
                                                .address.location);
                                        setState(() => FFAppState().profileimg =
                                            currentUserPhoto);

                                        context.pushNamed('ProfileEditPage');
                                      },
                                      child: Text(
                                        'Посмотреть профиль',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: StreamBuilder<List<ToolsRecord>>(
                            stream: queryToolsRecord(
                              queryBuilder: (toolsRecord) => toolsRecord.where(
                                  'created_by',
                                  isEqualTo: currentUserReference),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<ToolsRecord> columnToolsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnToolsRecord =
                                  columnToolsRecordList.isNotEmpty
                                      ? columnToolsRecordList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 14, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Мои инструменты',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        if ((columnToolsRecord != null) != null)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed('MyToolsPage');
                                            },
                                            text: 'Смотреть все',
                                            options: FFButtonOptions(
                                              width: 110,
                                              height: 31,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 12,
                                                  ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: FutureBuilder<List<ToolsRecord>>(
                                      future: queryToolsRecordOnce(
                                        queryBuilder: (toolsRecord) =>
                                            toolsRecord
                                                .where('created_by',
                                                    isEqualTo:
                                                        currentUserReference)
                                                .orderBy('created_at',
                                                    descending: true),
                                        limit: 2,
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ToolsRecord>
                                            listViewToolsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewToolsRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewToolsRecord =
                                                listViewToolsRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 16),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ToolDetailPage',
                                                    queryParams: {
                                                      'tool': serializeParam(
                                                        listViewToolsRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'tool':
                                                          listViewToolsRecord,
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: Image.network(
                                                        listViewToolsRecord
                                                            .photo!,
                                                        width: 80,
                                                        height: 116,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Text(
                                                              listViewToolsRecord
                                                                  .toolName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          12,
                                                                          0,
                                                                          12),
                                                              child: Text(
                                                                listViewToolsRecord
                                                                    .description!,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${listViewToolsRecord.price?.toString()} \$',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Container(
                                                                  width: 1,
                                                                  height: 18,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                      'd/M/y',
                                                                      listViewToolsRecord
                                                                          .buyDate!),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Container(
                                                                  width: 1,
                                                                  height: 18,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  listViewToolsRecord
                                                                      .shopName!,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
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
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: StreamBuilder<List<ReportsRecord>>(
                        stream: queryReportsRecord(
                          parent: currentUserReference,
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                ),
                              ),
                            );
                          }
                          List<ReportsRecord>
                              reportsContainerReportsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final reportsContainerReportsRecord =
                              reportsContainerReportsRecordList.isNotEmpty
                                  ? reportsContainerReportsRecordList.first
                                  : null;
                          return Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 14, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Мои отчеты',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        if (reportsContainerReportsRecord!
                                                .reference ==
                                            null)
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context
                                                    .pushNamed('ReportsPage');
                                              },
                                              text: 'Смотреть все',
                                              options: FFButtonOptions(
                                                width: 110,
                                                height: 31,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12,
                                                    ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: StreamBuilder<List<ReportsRecord>>(
                                      stream: queryReportsRecord(
                                        parent: currentUserReference,
                                        limit: 2,
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ReportsRecord>
                                            listViewReportsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewReportsRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewReportsRecord =
                                                listViewReportsRecordList[
                                                    listViewIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                          'd/M/y',
                                                          listViewReportsRecord
                                                              .startDate!),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                    Text(
                                                      ' - ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                          'd/M/y',
                                                          listViewReportsRecord
                                                              .endDate!),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        borderWidth: 1,
                                                        buttonSize: 50,
                                                        icon: Icon(
                                                          FFIcons
                                                              .kfreeIconFontDownload3917330,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 0, 0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 50,
                                                          icon: Icon(
                                                            FFIcons
                                                                .kfreeIconFontTrash3917378,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      ReportDelWidget(
                                                                    deleteReport:
                                                                        listViewReportsRecord,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
      },
    );
  }
}
