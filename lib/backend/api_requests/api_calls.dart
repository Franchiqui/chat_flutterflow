import 'dart:convert';
import 'dart:typed_data';
import 'package:chat/backend/api_requests/_/api_manager.dart';

import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String getBaseUrl() => 'https://pocketbase-chat.fly.dev';
  static Map<String, String> headers = {};
  static CrearCHATCall crearCHATCall = CrearCHATCall();
  static CrearUSERCall crearUSERCall = CrearUSERCall();
  static CrearMENSAJECall crearMENSAJECall = CrearMENSAJECall();
  static RegistroUSERCall registroUSERCall = RegistroUSERCall();
  static LeerUSERCall leerUSERCall = LeerUSERCall();
  static LeerCHATCall leerCHATCall = LeerCHATCall();
  static LeerMENSAJESCall leerMENSAJESCall = LeerMENSAJESCall();
  static ActualizarCHATCall actualizarCHATCall = ActualizarCHATCall();
  static ActualizarMENSAJECall actualizarMENSAJECall = ActualizarMENSAJECall();
  static LeerGrupoCall leerGrupoCall = LeerGrupoCall();
  static CrearGRUPOCall crearGRUPOCall = CrearGRUPOCall();
  static LeerMensajesGRUPOCall leerMensajesGRUPOCall = LeerMensajesGRUPOCall();
  static CrearMensajeGRUPOCall crearMensajeGRUPOCall = CrearMensajeGRUPOCall();
  static ActualizarCRUPOCall actualizarCRUPOCall = ActualizarCRUPOCall();
  static ActualizarMensajesGRUPOCall actualizarMensajesGRUPOCall =
      ActualizarMensajesGRUPOCall();
  static EliminarCHATCall eliminarCHATCall = EliminarCHATCall();
  static EliminarGRUPOCall eliminarGRUPOCall = EliminarGRUPOCall();
}

class CrearCHATCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? fotoUrlA = '',
    String? fotoUrlB = '',
    String? displayNameA = '',
    String? displayNameB = '',
    String? fechaChat = '',
    String? user1 = '',
    String? user2 = '',
    int? smsA,
    int? smsB,
    String? horaChat = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'crearCHAT',
      apiUrl: '${baseUrl}/api/collections/CHAT/records',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'id': id,
        'fotoUrl_A': fotoUrlA,
        'fotoUrl_B': fotoUrlB,
        'displayName_A': displayNameA,
        'displayName_B': displayNameB,
        'fechaChat': fechaChat,
        'user1': user1,
        'user2': user2,
        'smsA': smsA,
        'smsB': smsB,
        'horaChat': horaChat,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CrearUSERCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? username = '',
    String? password = '',
    String? passwordConfirm = '',
    String? displayNameA = '',
    FFUploadedFile? avatar,
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'crearUSER',
      apiUrl: '${baseUrl}/api/collections/users/records',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'id': id,
        'username': username,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'displayName_A': displayNameA,
        'avatar': avatar,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CrearMENSAJECall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? texto = '',
    String? user1 = '',
    String? user2 = '',
    String? idChat = '',
    String? fechaMensaje = '',
    bool? textoBool,
    bool? creado,
    String? displayNameB = '',
    String? user = '',
    FFUploadedFile? audio,
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'crearMENSAJE',
      apiUrl: '${baseUrl}/api/collections/mensajes/records',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'id': id,
        'texto': texto,
        'user1': user1,
        'user2': user2,
        'idChat': idChat,
        'fechaMensaje': fechaMensaje,
        'textoBool': textoBool,
        'creado': creado,
        'displayName_B': displayNameB,
        'user': user,
        'audio': audio,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegistroUSERCall {
  Future<ApiCallResponse> call({
    String? identity = '',
    String? password = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'registroUSER',
      apiUrl: '${baseUrl}/api/collections/users/auth-with-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'identity': identity,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? totalItems(dynamic response) => getJsonField(
        response,
        r'''$.record''',
      );
  String? nombre(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.record.displayName_A''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.record.id''',
      ));
  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.record.username''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.record.avatar''',
      ));
}

class LeerUSERCall {
  Future<ApiCallResponse> call({
    String? filter = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'leerUSER',
      apiUrl: '${baseUrl}/api/collections/users/records',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? totalItems(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nombre(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].displayName_A''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? username(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].username''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LeerCHATCall {
  Future<ApiCallResponse> call({
    String? filter = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'leerCHAT',
      apiUrl: '${baseUrl}/api/collections/CHAT/records',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? nombreA(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].displayName_A''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nombreB(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].displayName_B''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fecha(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].fechaChat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fotoA(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].fotoUrl_A''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fotoB(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].fotoUrl_B''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? user2(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].user2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? user1(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].user1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? smsB(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].smsB''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? smsA(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].smsA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? totalItems(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  List<String>? horaChat(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].horaChat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LeerMENSAJESCall {
  Future<ApiCallResponse> call({
    String? filter = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'leerMENSAJES',
      apiUrl: '${baseUrl}/api/collections/mensajes/records',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? nombreB(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].displayName_B''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fecha(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].fechaMensaje''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? idChat(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].idChat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? texto(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].texto''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? textoBool(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].textoBool''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? user1(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].user1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? user2(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].user2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? totalItems(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  List<String>? mensajeUrl(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].mensajeUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? audio(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].audio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? user(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? video(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].videoPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imagen(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].imagePath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nombreArchivo(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].fileName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? audioPath(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].audioPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? documento(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].documentoPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imagenUrl(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].imagenUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? tipo(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].tipo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? filePath(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].filePath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ActualizarCHATCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? ultimoMensaje = '',
    String? fechaChat = '',
    String? horaChat = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'actualizarCHAT',
      apiUrl: '${baseUrl}/api/collections/CHAT/records/${id}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {
        'id': id,
        'ultimoMensaje': ultimoMensaje,
        'fechaChat': fechaChat,
        'horaChat': horaChat,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActualizarMENSAJECall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? mensajeUrl = '',
    String? imagenUrl = '',
    String? tipo = '',
    String? fileName = '',
    String? fechaMensaje = '',
    String? idChat = '',
    String? user2 = '',
    String? user1 = '',
    String? user = '',
    String? displayNameB = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'actualizarMENSAJE',
      apiUrl: '${baseUrl}/api/collections/mensajes/records/${id}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {
        'id': id,
        'mensajeUrl': mensajeUrl,
        'imagenUrl': imagenUrl,
        'tipo': tipo,
        'fileName': fileName,
        'user': user,
        'user1': user1,
        'user2': user2,
        'idChat': idChat,
        'fechaMensaje': fechaMensaje,
        'displayName_B': displayNameB,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LeerGrupoCall {
  Future<ApiCallResponse> call({
    String? filter = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'leerGrupo',
      apiUrl: '${baseUrl}/api/collections/grupos/records',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? total(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  String? fecha(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].fechaChat''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].id''',
      ));
  String? nombre(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].nombreGrupo''',
      ));
  String? ultimo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].ultimoMensaje''',
      ));
  String? user(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].user''',
      ));
  bool? visto(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.items[:].visto''',
      ));
  String? hora(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].horaChat''',
      ));
  List? miembros(dynamic response) => getJsonField(
        response,
        r'''$.items[:].Miembros''',
        true,
      ) as List?;
  List<String>? miembrosAvatar(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].Miembros[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? miembrosID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].Miembros[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? mienbrosNombre(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].Miembros[:].nombre''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? menbers(dynamic response) => getJsonField(
        response,
        r'''$.items[:].members''',
        true,
      ) as List?;
  List<String>? nombreGrupo(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].groupName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? miembrosID2(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].miembrosId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CrearGRUPOCall {
  Future<ApiCallResponse> call({
    String? id = '',
    dynamic? miembrosJson,
    String? user = '',
    String? nombreGrupo = '',
    String? fechaChat = '',
    String? horaChat = '',
    String? ultimoMensaje = '',
    bool? visto,
    List<String>? miembrosIdList,
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();
    final miembrosId = _serializeList(miembrosIdList);
    final miembros = _serializeJson(miembrosJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'crearGRUPO',
      apiUrl: '${baseUrl}/api/collections/grupos/records',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'id': id,
        'Miembros': miembros,
        'user': user,
        'nombreGrupo': nombreGrupo,
        'fechaChat': fechaChat,
        'horaChat': horaChat,
        'ultimoMensaje': ultimoMensaje,
        'visto': visto,
        'miembrosId': miembrosId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LeerMensajesGRUPOCall {
  Future<ApiCallResponse> call({
    String? filter = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'leerMensajesGRUPO',
      apiUrl: '${baseUrl}/api/collections/group_messages/records',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  String? grupoID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].grupoId''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].id''',
      ));
  String? user(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].user''',
      ));
  String? texto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].texto''',
      ));
  String? grupo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].grupo''',
      ));
  List? miembros(dynamic response) => getJsonField(
        response,
        r'''$.items[:].Miembros''',
        true,
      ) as List?;
  List<String>? miembrosAvatar(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].Miembros[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? miembrosID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].Miembros[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? miembrosNombre(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].Miembros[:].nombre''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? audio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].audio''',
      ));
  String? filePath(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].filePath''',
      ));
  String? grupoNombre(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].groupName''',
      ));
  String? imagenUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].imagenUrl''',
      ));
  String? mensageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].mensajeUrl''',
      ));
  String? tipo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].tipo''',
      ));
  String? nombreGrupo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.items[:].nombreGrupo''',
      ));
}

class CrearMensajeGRUPOCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? user = '',
    String? texto = '',
    dynamic? miembrosJson,
    String? grupoId = '',
    String? nombreGrupo = '',
    String? grupo = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    final miembros = _serializeJson(miembrosJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'crearMensajeGRUPO',
      apiUrl: '${baseUrl}/api/collections/group_messages/records',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'id': id,
        'user': user,
        'texto': texto,
        'Miembros': miembros,
        'grupoId': grupoId,
        'nombreGrupo': nombreGrupo,
        'grupo': grupo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActualizarCRUPOCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? ultimoMensaje = '',
    String? horaChat = '',
    String? fechaChat = '',
    dynamic? miembrosJson,
    List<String>? miembrosIdList,
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();
    final miembrosId = _serializeList(miembrosIdList);
    final miembros = _serializeJson(miembrosJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'actualizarCRUPO',
      apiUrl: '${baseUrl}/api/collections/grupos/records/${id}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {
        'id': id,
        'ultimoMensaje': ultimoMensaje,
        'horaChat': horaChat,
        'fechaChat': fechaChat,
        ' Miembros': miembros,
        'miembrosId': miembrosId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActualizarMensajesGRUPOCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? grupo = '',
    String? grupoId = '',
    String? tipo = '',
    String? fileName = '',
    String? imagenUrl = '',
    String? mensajeUrl = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'actualizarMensajesGRUPO',
      apiUrl: '${baseUrl}/api/collections/group_messages/records/${id}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {
        'id': id,
        'grupo': grupo,
        'grupoId': grupoId,
        'tipo': tipo,
        'fileName': fileName,
        'imagenUrl': imagenUrl,
        'mensajeUrl': mensajeUrl,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EliminarCHATCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'eliminarCHAT',
      apiUrl: '${baseUrl}/api/collections/CHAT/records/${id}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EliminarGRUPOCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'eliminarGRUPO',
      apiUrl: '${baseUrl}/api/collections/grupos/records/${id}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OpenAI ChatGPT Group Code

class GptCall {
  static Future<ApiCallResponse> call({
    String? contentSystem = '',
    String? contentUser = '',
    bool? prefix,
  }) async {
    final ffApiRequestBody = '''
{
  "model": "deepseek-chat",
  "messages": [
    {
      "role": "system",
      "content": "${escapeStringForJson(contentSystem)}"
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(contentUser)}"
    },
    {
      "role": "assistant",
      "content": "\`\`\`python\\n",
      "prefix": ${prefix}
    }
  ],
  "stop": [
    "\`\`\`"
  ],
  "temperature": 0.7,
  "max_tokens": 1000,
  "top_p": 0.9
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GPT',
      apiUrl: 'https://api.deepseek.com/beta/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk-b66f2903508e4a4c91cbd8c60d130fb8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VariosCall {
  static Future<ApiCallResponse> call({
    String? url = '',
    String? text = '',
    FFUploadedFile? fileMp3,
    String? id = '',
    String? user = '',
    String? user2 = '',
    String? idChat = '',
    String? fechaMensaje = '',
    String? tipo = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'VARIOS',
      apiUrl: '${url}',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'URL': url,
        'text': text,
        'fileMp3': fileMp3,
        'id': id,
        'user': user,
        'user2': user2,
        'idChat': idChat,
        'fechaMensaje': fechaMensaje,
        'tipo': tipo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? vozTEXTO(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.file_url''',
      ));
  static dynamic audioID(dynamic response) => getJsonField(
        response,
        r'''$.response.id''',
      );
  static dynamic audioNombre(dynamic response) => getJsonField(
        response,
        r'''$.response.audio''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
