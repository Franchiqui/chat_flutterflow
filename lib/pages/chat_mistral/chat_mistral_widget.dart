import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/fondo_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_mistral_model.dart';
export 'chat_mistral_model.dart';

class ChatMistralWidget extends StatefulWidget {
  const ChatMistralWidget({
    super.key,
    this.displayNameB,
    this.userIdB,
    this.idChat,
    this.text,
    this.fotoUrlB,
    this.userIdA,
  });

  final String? displayNameB;
  final String? userIdB;
  final String? idChat;
  final String? text;
  final String? fotoUrlB;
  final String? userIdA;

  static String routeName = 'ChatMistral';
  static String routePath = '/chatMistral';

  @override
  State<ChatMistralWidget> createState() => _ChatMistralWidgetState();
}

class _ChatMistralWidgetState extends State<ChatMistralWidget> {
  late ChatMistralModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMistralModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().textoBool = true;
      FFAppState().user1 = currentUserData!.uid;
      FFAppState().user2 = widget!.userIdB!;
      safeSetState(() {});
      _model.mENSAJESs = await OpenAIChatGPTGroup.leerMENSAJESCall.call();
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent1,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                ),
                child: wrapWithModel(
                  model: _model.fondoCopyModel,
                  updateCallback: () => safeSetState(() {}),
                  child: FondoCopyWidget(),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: custom_widgets.ChatScreenMistral(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  apiUrl: '192.168.1.200:11430',
                  apiUser: 'Franchiqui',
                  apiPass: 'Cruzcampo\$5230Cruzcampo',
                  userImagePath:
                      'https://pocketbase-chat.fly.dev/api/files/_pb_users_auth_/${currentUserData?.uid}/${currentUserData?.fotoUrl}',
                  headerColor: FlutterFlowTheme.of(context).accent1,
                  backgroundColor: Colors.transparent,
                  userBubbleColor: FlutterFlowTheme.of(context).accent2,
                  assistantBubbleColor: FlutterFlowTheme.of(context).accent3,
                  progressIndicatorColor: FlutterFlowTheme.of(context).tertiary,
                  textColor: Colors.white,
                  headerTitle: 'Asistente Personalizado',
                  placeholderText: 'Escribe tu mensaje...',
                  connectionInfoText: 'Conectado a:',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
