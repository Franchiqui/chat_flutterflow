import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/fondo_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'chat_mistral_widget.dart' show ChatMistralWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatMistralModel extends FlutterFlowModel<ChatMistralWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (leerMENSAJES)] action in ChatMistral widget.
  ApiCallResponse? mENSAJESs;
  // Model for fondoCopy component.
  late FondoCopyModel fondoCopyModel;

  @override
  void initState(BuildContext context) {
    fondoCopyModel = createModel(context, () => FondoCopyModel());
  }

  @override
  void dispose() {
    fondoCopyModel.dispose();
  }
}
