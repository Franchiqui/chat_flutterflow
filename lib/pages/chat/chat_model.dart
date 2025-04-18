import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/fondo_copy_widget.dart';
import '/components/opciones_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<String> extImagen = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
  void addToExtImagen(String item) => extImagen.add(item);
  void removeFromExtImagen(String item) => extImagen.remove(item);
  void removeAtIndexFromExtImagen(int index) => extImagen.removeAt(index);
  void insertAtIndexInExtImagen(int index, String item) =>
      extImagen.insert(index, item);
  void updateExtImagenAtIndex(int index, Function(String) updateFn) =>
      extImagen[index] = updateFn(extImagen[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUrlImage] action in Chat widget.
  String? url2;
  // Model for fondoCopy component.
  late FondoCopyModel fondoCopyModel;
  // Stores action output result for [Backend Call - API (actualizarCHAT)] action in Icon widget.
  ApiCallResponse? apiResultw;
  // Stores action output result for [Backend Call - API (actualizarCHAT)] action in ChatScreen widget.
  ApiCallResponse? apiResultqta;
  // Stores action output result for [Backend Call - API (leerMENSAJES)] action in ChatScreen widget.
  ApiCallResponse? datos;
  // Stores action output result for [Custom Action - getUrlImage] action in ChatScreen widget.
  String? url;
  // State field(s) for TextFieldChat widget.
  FocusNode? textFieldChatFocusNode;
  TextEditingController? textFieldChatTextController;
  String? Function(BuildContext, String?)? textFieldChatTextControllerValidator;
  // Stores action output result for [Backend Call - API (actualizarMENSAJE)] action in AudioRecorderScreen widget.
  ApiCallResponse? apiResultl4ntx;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Stores action output result for [Backend Call - API (actualizarCHAT)] action in IconoEnvioChat widget.
  ApiCallResponse? apiResultw69;
  // Stores action output result for [Backend Call - API (actualizarMENSAJE)] action in IconoEnvioChat widget.
  ApiCallResponse? apiResultl4ntxh;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (crearGRUPO)] action in Button widget.
  ApiCallResponse? apiResultr2aaw;

  @override
  void initState(BuildContext context) {
    fondoCopyModel = createModel(context, () => FondoCopyModel());
  }

  @override
  void dispose() {
    fondoCopyModel.dispose();
    textFieldChatFocusNode?.dispose();
    textFieldChatTextController?.dispose();

    timerController.dispose();
    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
