import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fondo_copy_model.dart';
export 'fondo_copy_model.dart';

class FondoCopyWidget extends StatefulWidget {
  const FondoCopyWidget({super.key});

  @override
  State<FondoCopyWidget> createState() => _FondoCopyWidgetState();
}

class _FondoCopyWidgetState extends State<FondoCopyWidget> {
  late FondoCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FondoCopyModel());

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
      width: 401.6,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
      ),
      child: Builder(
        builder: (context) {
          final lista20 = _model.lista1.toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(lista20.length, (lista20Index) {
                final lista20Item = lista20[lista20Index];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final lista10 = _model.lista1.toList();

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(lista10.length, (lista10Index) {
                            final lista10Item = lista10[lista10Index];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 7.0, 0.0, 0.0),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.chat_bubble_outline_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      size: 20.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 6.0, 0.0),
                                    child: Icon(
                                      Icons.chat_bubble_outline_outlined,
                                      color: Color(0xAF57636C),
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
