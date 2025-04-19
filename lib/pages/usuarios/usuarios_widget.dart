import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'usuarios_model.dart';
export 'usuarios_model.dart';

class UsuariosWidget extends StatefulWidget {
  const UsuariosWidget({
    super.key,
    this.nombreGrupo,
  });

  final String? nombreGrupo;

  static String routeName = 'Usuarios';
  static String routePath = '/usuarios';

  @override
  State<UsuariosWidget> createState() => _UsuariosWidgetState();
}

class _UsuariosWidgetState extends State<UsuariosWidget> {
  late UsuariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsuariosModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      future: OpenAIChatGPTGroup.leerUSERCall.call(),
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
        final usuariosLeerUSERResponse = snapshot.data!;

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
                                  children: [],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'enableButtonsDrag.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 1.5,
                                          ),
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue1 ??= true,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue1 = newValue!);
                                          if (newValue!) {
                                            FFAppState().enableButtonsDrag =
                                                true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().enableButtonsDrag =
                                                false;
                                            safeSetState(() {});
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'checkFontOverflows.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 1.5,
                                          ),
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue2 ??= true,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue2 = newValue!);
                                          if (newValue!) {
                                            FFAppState().checkFontOverflows =
                                                true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().checkFontOverflows =
                                                false;
                                            safeSetState(() {});
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'checkImageLabels.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 1.5,
                                          ),
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue3 ??= true,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue3 = newValue!);
                                          if (newValue!) {
                                            FFAppState().checkImageLabels =
                                                true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().checkImageLabels =
                                                false;
                                            safeSetState(() {});
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'checkTextContrast.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 1.5,
                                          ),
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue4 ??= true,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue4 = newValue!);
                                          if (newValue!) {
                                            FFAppState().checkTextContrast =
                                                true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().checkTextContrast =
                                                false;
                                            safeSetState(() {});
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'checkTapTargets.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 1.5,
                                          ),
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue5 ??= true,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue5 = newValue!);
                                          if (newValue!) {
                                            FFAppState().checkTapTargets = true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().checkTapTargets =
                                                false;
                                            safeSetState(() {});
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'darkTheme.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 1.5,
                                          ),
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue6 ??= true,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue6 = newValue!);
                                          if (newValue!) {
                                            FFAppState().darkTheme = true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().darkTheme = false;
                                            safeSetState(() {});
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          FFAppState().contrastRatio.toString(),
                                          '1',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Container(
                                        width: 200.0,
                                        height: 35.0,
                                        child:
                                            custom_widgets.CustomSliderProgress(
                                          width: 200.0,
                                          height: 35.0,
                                          minValue: 1,
                                          maxValue: 10,
                                          currentValue: 4,
                                          sliderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent3,
                                          thumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          trackHeight: 5.0,
                                          thumbRadius: 15.0,
                                          valueChanged: (onChanged) async {
                                            FFAppState().contrastRatio =
                                                onChanged.toDouble();
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
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
              ),
            ),
            body: SafeArea(
              top: true,
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 60.0,
                              height: 37.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 60.0,
                                  height: 37.0,
                                  child: custom_widgets.AccessibilityTools(
                                    width: 60.0,
                                    height: 37.0,
                                    enableButtonsDrag:
                                        FFAppState().enableButtonsDrag,
                                    checkFontOverflows:
                                        FFAppState().checkFontOverflows,
                                    checkImageLabels:
                                        FFAppState().checkImageLabels,
                                    checkTextContrast:
                                        FFAppState().checkTextContrast,
                                    checkTapTargets:
                                        FFAppState().checkTapTargets,
                                    contrastRatioThreshold:
                                        FFAppState().contrastRatio,
                                    child: Icon(
                                      Icons.ads_click_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      size: 32.0,
                                    ),
                                    buttonsAlignment: (bottomRight) async {
                                      FFAppState().darkTheme = bottomRight;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
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
                                color: FlutterFlowTheme.of(context).primaryText,
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
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info,
                          ),
                          child: FutureBuilder<ApiCallResponse>(
                            future: OpenAIChatGPTGroup.leerUSERCall.call(
                              filter: 'filter=(username ~ \'\')',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final columnLeerUSERResponse = snapshot.data!;

                              return SingleChildScrollView(
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 25.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        Container(
                                                          width: 330.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController,
                                                            focusNode: _model
                                                                .textFieldFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController',
                                                              Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () async {
                                                                FFAppState()
                                                                        .busqueda =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'Busca por Nombre....',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        15.0,
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
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .textController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.close,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 34.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        61.0,
                                                                        0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .search,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  if (!FFAppState().busqueda)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    25.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final users = OpenAIChatGPTGroup
                                                                    .leerUSERCall
                                                                    .totalItems(
                                                                      usuariosLeerUSERResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toList() ??
                                                                [];

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  users.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      usersIndex) {
                                                                final usersItem =
                                                                    users[
                                                                        usersIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          35.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .idChat =
                                                                          random_data
                                                                              .randomString(
                                                                        15,
                                                                        15,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.apiResultr2a = await OpenAIChatGPTGroup
                                                                          .crearCHATCall
                                                                          .call(
                                                                        id: FFAppState()
                                                                            .idChat,
                                                                        fotoUrlB:
                                                                            getJsonField(
                                                                          usersItem,
                                                                          r'''$.avatar''',
                                                                        ).toString(),
                                                                        displayNameA:
                                                                            currentUserData?.displayName,
                                                                        displayNameB:
                                                                            getJsonField(
                                                                          usersItem,
                                                                          r'''$.username''',
                                                                        ).toString(),
                                                                        fechaChat: dateTimeFormat(
                                                                            "Hm",
                                                                            getCurrentTimestamp),
                                                                        user1: currentUserData
                                                                            ?.uid,
                                                                        user2:
                                                                            getJsonField(
                                                                          usersItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                        fotoUrlA:
                                                                            currentUserData?.fotoUrl,
                                                                      );

                                                                      context
                                                                          .pushNamed(
                                                                        ChatWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'displayNameB':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              usersItem,
                                                                              r'''$.username''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'userIdB':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              usersItem,
                                                                              r'''$.id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'idChat':
                                                                              serializeParam(
                                                                            FFAppState().idChat,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                8.0,
                                                                            shape:
                                                                                const CircleBorder(),
                                                                            child:
                                                                                Container(
                                                                              width: 70.0,
                                                                              height: 70.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: Image.network(
                                                                                    'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${getJsonField(
                                                                                      usersItem,
                                                                                      r'''$.id''',
                                                                                    ).toString()}/${getJsonField(
                                                                                      usersItem,
                                                                                      r'''$.avatar''',
                                                                                    ).toString()}',
                                                                                  ).image,
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 8.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.629,
                                                                                    height: 50.4,
                                                                                    decoration: BoxDecoration(
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: Color(0xB2FFFFFF),
                                                                                          offset: Offset(
                                                                                            0.0,
                                                                                            2.0,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      gradient: LinearGradient(
                                                                                        colors: [
                                                                                          Color(0xFFB9B0F4),
                                                                                          Color(0x3339D2C0)
                                                                                        ],
                                                                                        stops: [0.0, 1.0],
                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    usersItem,
                                                                                                    r'''$.username''',
                                                                                                  )?.toString(),
                                                                                                  'Antonio Martin Gonzales',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: Color(0xFF211783),
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  if (FFAppState().busqueda)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    25.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final users = OpenAIChatGPTGroup
                                                                    .leerUSERCall
                                                                    .totalItems(
                                                                      usuariosLeerUSERResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toList() ??
                                                                [];

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  users.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      usersIndex) {
                                                                final usersItem =
                                                                    users[
                                                                        usersIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          35.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .idChat =
                                                                          random_data
                                                                              .randomString(
                                                                        15,
                                                                        15,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.apiResultr2aa = await OpenAIChatGPTGroup
                                                                          .crearCHATCall
                                                                          .call(
                                                                        id: FFAppState()
                                                                            .idChat,
                                                                        fotoUrlB:
                                                                            getJsonField(
                                                                          usersItem,
                                                                          r'''$.avatar''',
                                                                        ).toString(),
                                                                        displayNameA:
                                                                            currentUserData?.displayName,
                                                                        displayNameB:
                                                                            getJsonField(
                                                                          usersItem,
                                                                          r'''$.username''',
                                                                        ).toString(),
                                                                        fechaChat: dateTimeFormat(
                                                                            "d/M/y",
                                                                            getCurrentTimestamp),
                                                                        user1: currentUserData
                                                                            ?.uid,
                                                                        user2:
                                                                            getJsonField(
                                                                          usersItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                        fotoUrlA:
                                                                            currentUserData?.fotoUrl,
                                                                        horaChat: dateTimeFormat(
                                                                            "Hm",
                                                                            getCurrentTimestamp),
                                                                      );

                                                                      await OpenAIChatGPTGroup
                                                                          .crearMENSAJECall
                                                                          .call(
                                                                        user1: currentUserData
                                                                            ?.uid,
                                                                        user2:
                                                                            getJsonField(
                                                                          usersItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                        idChat:
                                                                            FFAppState().idChat,
                                                                        fechaMensaje: dateTimeFormat(
                                                                            "Hm",
                                                                            getCurrentTimestamp),
                                                                      );

                                                                      context
                                                                          .pushNamed(
                                                                        ChatWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'displayNameB':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              usersItem,
                                                                              r'''$.username''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'userIdB':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              usersItem,
                                                                              r'''$.id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'idChat':
                                                                              serializeParam(
                                                                            FFAppState().idChat,
                                                                            ParamType.String,
                                                                          ),
                                                                          'fotoUrlB':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              usersItem,
                                                                              r'''$.avatar''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                8.0,
                                                                            shape:
                                                                                const CircleBorder(),
                                                                            child:
                                                                                Container(
                                                                              width: 70.0,
                                                                              height: 70.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: Image.network(
                                                                                    'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${getJsonField(
                                                                                      usersItem,
                                                                                      r'''$.id''',
                                                                                    ).toString()}/${getJsonField(
                                                                                      usersItem,
                                                                                      r'''$.avatar''',
                                                                                    ).toString()}',
                                                                                  ).image,
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 8.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.629,
                                                                                    height: 50.4,
                                                                                    decoration: BoxDecoration(
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: Color(0xB2FFFFFF),
                                                                                          offset: Offset(
                                                                                            0.0,
                                                                                            2.0,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      gradient: LinearGradient(
                                                                                        colors: [
                                                                                          Color(0xFFB9B0F4),
                                                                                          Color(0x3339D2C0)
                                                                                        ],
                                                                                        stops: [0.0, 1.0],
                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    usersItem,
                                                                                                    r'''$.username''',
                                                                                                  )?.toString(),
                                                                                                  'Antonio Martin Gonzales',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: Color(0xFF211783),
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
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
                                  ],
                                ),
                              );
                            },
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
      },
    );
  }
}
