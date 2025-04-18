// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAuthStruct extends BaseStruct {
  UserAuthStruct({
    String? uid,
    String? displayName,
    String? fotoUrl,
    String? contrasena,
  })  : _uid = uid,
        _displayName = displayName,
        _fotoUrl = fotoUrl,
        _contrasena = contrasena;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  set fotoUrl(String? val) => _fotoUrl = val;

  bool hasFotoUrl() => _fotoUrl != null;

  // "contrasena" field.
  String? _contrasena;
  String get contrasena => _contrasena ?? '';
  set contrasena(String? val) => _contrasena = val;

  bool hasContrasena() => _contrasena != null;

  static UserAuthStruct fromMap(Map<String, dynamic> data) => UserAuthStruct(
        uid: data['uid'] as String?,
        displayName: data['display_name'] as String?,
        fotoUrl: data['fotoUrl'] as String?,
        contrasena: data['contrasena'] as String?,
      );

  static UserAuthStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserAuthStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'display_name': _displayName,
        'fotoUrl': _fotoUrl,
        'contrasena': _contrasena,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'fotoUrl': serializeParam(
          _fotoUrl,
          ParamType.String,
        ),
        'contrasena': serializeParam(
          _contrasena,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserAuthStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserAuthStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        fotoUrl: deserializeParam(
          data['fotoUrl'],
          ParamType.String,
          false,
        ),
        contrasena: deserializeParam(
          data['contrasena'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserAuthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAuthStruct &&
        uid == other.uid &&
        displayName == other.displayName &&
        fotoUrl == other.fotoUrl &&
        contrasena == other.contrasena;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([uid, displayName, fotoUrl, contrasena]);
}

UserAuthStruct createUserAuthStruct({
  String? uid,
  String? displayName,
  String? fotoUrl,
  String? contrasena,
}) =>
    UserAuthStruct(
      uid: uid,
      displayName: displayName,
      fotoUrl: fotoUrl,
      contrasena: contrasena,
    );
