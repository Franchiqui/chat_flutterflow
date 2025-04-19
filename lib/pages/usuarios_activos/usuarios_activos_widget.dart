import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/eliminar_c_h_a_t_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'usuarios_activos_model.dart';
export 'usuarios_activos_model.dart';

class UsuariosActivosWidget extends StatefulWidget {
  const UsuariosActivosWidget({super.key});

  static String routeName = 'UsuariosActivos';
  static String routePath = '/usuariosActivos';

  @override
  State<UsuariosActivosWidget> createState() => _UsuariosActivosWidgetState();
}

class _UsuariosActivosWidgetState extends State<UsuariosActivosWidget> {
  late UsuariosActivosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsuariosActivosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.apiRequestCompleter3 = null);
      await _model.waitForApiRequestCompleted3();
      safeSetState(() => _model.apiRequestCompleter2 = null);
      await _model.waitForApiRequestCompleted2();
      safeSetState(() => _model.apiRequestCompleter1 = null);
      await _model.waitForApiRequestCompleted1();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter3 ??= Completer<ApiCallResponse>()
            ..complete(OpenAIChatGPTGroup.leerCHATCall.call()))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).accent1,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final usuariosActivosLeerCHATResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).accent1,
            drawer: Drawer(
              elevation: 16.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(0.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 110.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).info,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Opacity(
                                opacity: 0.0,
                                child: Icon(
                                  Icons.arrow_back,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${currentUserData?.uid}/${currentUserData?.fotoUrl}',
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: true,
                                            tag:
                                                'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${currentUserData?.uid}/${currentUserData?.fotoUrl}',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${currentUserData?.uid}/${currentUserData?.fotoUrl}',
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        width: 140.0,
                                        height: 140.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${currentUserData?.uid}/${currentUserData?.fotoUrl}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.pencilAlt,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 335.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  currentUserData?.displayName,
                                  'Display Name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Merriweather',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 26.0,
                                      letterSpacing: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await authManager.signOut();
                                          GoRouter.of(context)
                                              .clearRedirectLocation();

                                          context.goNamedAuth(
                                              InicioyRegistroWidget.routeName,
                                              context.mounted);
                                        },
                                        child: Icon(
                                          Icons.output_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 44.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 12.0),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          safeSetState(() => FFAppState().dark =
                                              !FFAppState().dark);
                                          setDarkModeSetting(
                                            context,
                                            FFAppState().dark
                                                ? ThemeMode.dark
                                                : ThemeMode.light,
                                          );
                                        },
                                        value: FFAppState().dark,
                                        onIcon: Icon(
                                          Icons.light_mode,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 45.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.dark_mode_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 45.0,
                                        ),
                                      ),
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
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.09,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Chat Activos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Merriweather',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                child: Icon(
                                  Icons.density_medium_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 26.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.85,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).info,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 25.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: (_model
                                                          .apiRequestCompleter2 ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(
                                                            OpenAIChatGPTGroup
                                                                .leerCHATCall
                                                                .call(
                                                          filter:
                                                              'filter=(user1 = \'${currentUserData?.uid}\')',
                                                        )))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewLeerCHATResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final chat =
                                                        OpenAIChatGPTGroup
                                                                .leerCHATCall
                                                                .totalItems(
                                                                  listViewLeerCHATResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: chat.length,
                                                      itemBuilder:
                                                          (context, chatIndex) {
                                                        final chatItem =
                                                            chat[chatIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      18.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.goNamed(
                                                                ChatWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'displayNameB':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.displayName_B''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userIdB':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.user2''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'idChat':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.id''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'fotoUrlB':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.fotoUrl_B''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userIdA':
                                                                      serializeParam(
                                                                    currentUserData
                                                                        ?.uid,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              FFAppState()
                                                                      .idChat =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.id''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .mistaMensajes =
                                                                  FFAppState()
                                                                      .mistaMensajes
                                                                      .where((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.items''',
                                                                          ))
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                              FFAppState()
                                                                      .user1 =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.user1''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .user2 =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.user2''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .fotoUrl =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.fotoUrl_B''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .textoFile =
                                                                  '...';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter3 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted3();
                                                            },
                                                            onLongPress:
                                                                () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          EliminarCHATWidget(
                                                                        idChatGrupo:
                                                                            getJsonField(
                                                                          chatItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 4.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.88,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            5.0,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              90.0,
                                                                          height:
                                                                              90.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(2.0),
                                                                            child:
                                                                                Container(
                                                                              width: 120.0,
                                                                              height: 120.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${getJsonField(
                                                                                  chatItem,
                                                                                  r'''$.user2''',
                                                                                ).toString()}/${getJsonField(
                                                                                  chatItem,
                                                                                  r'''$.fotoUrl_B''',
                                                                                ).toString()}',
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                chatItem,
                                                                                r'''$.displayName_B''',
                                                                              )?.toString(),
                                                                              'Nombre usuario',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                chatItem,
                                                                                r'''$.ultimoMensaje''',
                                                                              )?.toString(),
                                                                              'Hola que tal?',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 20,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.done_all_sharp,
                                                                                  color: colorFromCssString(
                                                                                    false.toString(),
                                                                                    defaultColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  size: 16.0,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.done_all_sharp,
                                                                                  color: Color(0xFFEEF200),
                                                                                  size: 16.0,
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            chatItem,
                                                                                            r'''$.fechaChat''',
                                                                                          )?.toString(),
                                                                                          '5/3/25',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          chatItem,
                                                                                          r'''$.horaChat''',
                                                                                        )?.toString(),
                                                                                        '12:25',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            FutureBuilder<ApiCallResponse>(
                                              future: (_model
                                                          .apiRequestCompleter1 ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(
                                                            OpenAIChatGPTGroup
                                                                .leerCHATCall
                                                                .call(
                                                          filter:
                                                              'filter=(user2 = \'${currentUserData?.uid}\')',
                                                        )))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewLeerCHATResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final chat =
                                                        OpenAIChatGPTGroup
                                                                .leerCHATCall
                                                                .totalItems(
                                                                  listViewLeerCHATResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: chat.length,
                                                      itemBuilder:
                                                          (context, chatIndex) {
                                                        final chatItem =
                                                            chat[chatIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      18.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                ChatWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'displayNameB':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.displayName_A''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userIdB':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.user1''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'idChat':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.id''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'fotoUrlB':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.fotoUrl_A''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userIdA':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      chatItem,
                                                                      r'''$.user2''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              FFAppState()
                                                                      .idChat =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.id''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .mistaMensajes =
                                                                  FFAppState()
                                                                      .mistaMensajes
                                                                      .where((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.items''',
                                                                          ))
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                              FFAppState()
                                                                      .user1 =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.user1''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .user2 =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.user2''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .fotoUrl =
                                                                  getJsonField(
                                                                chatItem,
                                                                r'''$.fotoUrl_B''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .textoFile =
                                                                  '...';
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter3 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted3();
                                                            },
                                                            onLongPress:
                                                                () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          EliminarCHATWidget(
                                                                        idChatGrupo:
                                                                            getJsonField(
                                                                          chatItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 4.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.88,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            5.0,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              90.0,
                                                                          height:
                                                                              90.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(2.0),
                                                                            child:
                                                                                Container(
                                                                              width: 120.0,
                                                                              height: 120.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${getJsonField(
                                                                                  chatItem,
                                                                                  r'''$.user1''',
                                                                                ).toString()}/${getJsonField(
                                                                                  chatItem,
                                                                                  r'''$.fotoUrl_A''',
                                                                                ).toString()}',
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                chatItem,
                                                                                r'''$.displayName_A''',
                                                                              )?.toString(),
                                                                              'Nombre usuario',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              getJsonField(
                                                                                chatItem,
                                                                                r'''$.ultimoMensaje''',
                                                                              )?.toString(),
                                                                              'Hola que Tal?',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 20,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.done_all_sharp,
                                                                                  color: colorFromCssString(
                                                                                    false.toString(),
                                                                                    defaultColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                  size: 16.0,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.done_all_sharp,
                                                                                  color: Color(0xFFEEF200),
                                                                                  size: 16.0,
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            chatItem,
                                                                                            r'''$.fechaChat''',
                                                                                          )?.toString(),
                                                                                          '5/3/25',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          chatItem,
                                                                                          r'''$.horaChat''',
                                                                                        )?.toString(),
                                                                                        '11:25',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 25.0, 20.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 15.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF081034),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFCB1BD9),
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.white,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      fillColor: Color(0xFF081034),
                                      icon: Icon(
                                        Icons.person_search,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                            UsuariosWidget.routeName);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 25.0, 50.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        GruposActivosWidget.routeName);
                                  },
                                  child: Stack(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 15.0,
                                        shape: const CircleBorder(),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFCB1BD9),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 15.0,
                                              shape: const CircleBorder(),
                                              child: Container(
                                                width: 60.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF081034),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 12.0),
                                                  child: Icon(
                                                    Icons
                                                        .chat_bubble_outline_rounded,
                                                    color: Color(0xFF95A1AC),
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 15.0, 20.0),
                                        child: Icon(
                                          Icons.chat_bubble_outline_rounded,
                                          color: Color(0xFFDFC7C7),
                                          size: 24.0,
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
