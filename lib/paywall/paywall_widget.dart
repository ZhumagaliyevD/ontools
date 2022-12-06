import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaywallWidget extends StatefulWidget {
  const PaywallWidget({Key? key}) : super(key: key);

  @override
  _PaywallWidgetState createState() => _PaywallWidgetState();
}

class _PaywallWidgetState extends State<PaywallWidget> {
  bool? isPurchaseMontly;
  bool? isPurchaseSixMonths;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/X_-_3.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xF1FFFFFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                            child: Image.asset(
                              'assets/images/OnTools_logo1_2.png',
                              width: 100,
                              height: 48,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            'Выбери подписку',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: Text(
                              'Orci, ante in platea lectus pulvinar. Cursus vestibulum nullam tincidunt diam. Aenean quis.',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    isPurchaseSixMonths = await revenue_cat
                                        .purchasePackage(revenue_cat.offerings!
                                            .current!.sixMonth!.identifier);
                                    _shouldSetState = true;
                                    if (isPurchaseSixMonths!) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Подписка оформлена!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0x00000000),
                                        ),
                                      );
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed('ProfileHomePage');

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Не удалось купить подписку!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFF242424),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.crown,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 25,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(24, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .annual!
                                                        .product
                                                        .title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      '\$ 49.99',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
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
                                ),
                              ),
                            ],
                          ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isCompleteTrial, false))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: AuthUserStreamWidget(
                                child: InkWell(
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    isPurchaseMontly = await revenue_cat
                                        .purchasePackage(revenue_cat.offerings!
                                            .current!.monthly!.identifier);
                                    _shouldSetState = true;
                                    if (isPurchaseSixMonths!) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Подписка оформлена!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0x00000000),
                                        ),
                                      );
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed('ProfileHomePage');

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Не удалось купить подписку!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFF242424),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                fillColor: Color(0xFFF3E36A),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.crown,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 25,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(24, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .monthly!
                                                        .product
                                                        .title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      '\$ 5.99',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
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
                                ),
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 50),
                            child: InkWell(
                              onTap: () async {
                                final userUpdateData = createUserRecordData(
                                  trialStart: getCurrentTimestamp,
                                  isCompleteTrial: true,
                                );
                                await currentUserReference!
                                    .update(userUpdateData);

                                context.pushNamed('ProfileHomePage');
                              },
                              child: Container(
                                width: 100,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0xFF242424),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            fillColor: Color(0xFFB6BAC1),
                                            icon: Icon(
                                              Icons.watch_later_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Пробный доступ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'Бесплатно 30 дней',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
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
                            ),
                          ),
                        ],
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
