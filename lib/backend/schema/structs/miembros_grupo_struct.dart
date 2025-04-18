// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MiembrosGrupoStruct extends BaseStruct {
  MiembrosGrupoStruct({
    String? id,
    String? nombre,
    String? avatar,
  })  : _id = id,
        _nombre = nombre,
        _avatar = avatar;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  static MiembrosGrupoStruct fromMap(Map<String, dynamic> data) =>
      MiembrosGrupoStruct(
        id: data['id'] as String?,
        nombre: data['nombre'] as String?,
        avatar: data['avatar'] as String?,
      );

  static MiembrosGrupoStruct? maybeFromMap(dynamic data) => data is Map
      ? MiembrosGrupoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nombre': _nombre,
        'avatar': _avatar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
      }.withoutNulls;

  static MiembrosGrupoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MiembrosGrupoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MiembrosGrupoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MiembrosGrupoStruct &&
        id == other.id &&
        nombre == other.nombre &&
        avatar == other.avatar;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nombre, avatar]);
}

MiembrosGrupoStruct createMiembrosGrupoStruct({
  String? id,
  String? nombre,
  String? avatar,
}) =>
    MiembrosGrupoStruct(
      id: id,
      nombre: nombre,
      avatar: avatar,
    );
