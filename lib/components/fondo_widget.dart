import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fondo_model.dart';
export 'fondo_model.dart';

class FondoWidget extends StatefulWidget {
  const FondoWidget({super.key});

  @override
  State<FondoWidget> createState() => _FondoWidgetState();
}

class _FondoWidgetState extends State<FondoWidget> {
  late FondoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FondoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 401.64,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.1, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.1, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.1, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.1, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.1, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.1, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.1, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: FlutterFlowTheme.of(context).success,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 7.0, 6.0, 0.0),
                          child: Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Color(0x7957636C),
                            size: 25.0,
                          ),
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
    );
  }
}
