import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ultimoMensaje = prefs.getString('ff_ultimoMensaje') ?? _ultimoMensaje;
    });
    _safeInit(() {
      _dark = prefs.getBool('ff_dark') ?? _dark;
    });
    _safeInit(() {
      _tamaoTexto = prefs.getDouble('ff_tamaoTexto') ?? _tamaoTexto;
    });
    _safeInit(() {
      _interfazColor = _colorFromIntValue(prefs.getInt('ff_interfazColor')) ??
          _interfazColor;
    });
    _safeInit(() {
      _burbujaColor1 = _colorFromIntValue(prefs.getInt('ff_burbujaColor1')) ??
          _burbujaColor1;
    });
    _safeInit(() {
      _burbujaColor2 = _colorFromIntValue(prefs.getInt('ff_burbujaColor2')) ??
          _burbujaColor2;
    });
    _safeInit(() {
      _textoInterfazColor =
          _colorFromIntValue(prefs.getInt('ff_textoInterfazColor')) ??
              _textoInterfazColor;
    });
    _safeInit(() {
      _textoMensajeColor =
          _colorFromIntValue(prefs.getInt('ff_textoMensajeColor')) ??
              _textoMensajeColor;
    });
    _safeInit(() {
      _textoFechaColor =
          _colorFromIntValue(prefs.getInt('ff_textoFechaColor')) ??
              _textoFechaColor;
    });
    _safeInit(() {
      _interfazColor2 = _colorFromIntValue(prefs.getInt('ff_interfazColor2')) ??
          _interfazColor2;
    });
    _safeInit(() {
      _tamano = prefs.getDouble('ff_tamano') ?? _tamano;
    });
    _safeInit(() {
      _contrastRatio = prefs.getDouble('ff_contrastRatio') ?? _contrastRatio;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _mistaMensajes = [];
  List<dynamic> get mistaMensajes => _mistaMensajes;
  set mistaMensajes(List<dynamic> value) {
    _mistaMensajes = value;
  }

  void addToMistaMensajes(dynamic value) {
    mistaMensajes.add(value);
  }

  void removeFromMistaMensajes(dynamic value) {
    mistaMensajes.remove(value);
  }

  void removeAtIndexFromMistaMensajes(int index) {
    mistaMensajes.removeAt(index);
  }

  void updateMistaMensajesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    mistaMensajes[index] = updateFn(_mistaMensajes[index]);
  }

  void insertAtIndexInMistaMensajes(int index, dynamic value) {
    mistaMensajes.insert(index, value);
  }

  bool _creado = false;
  bool get creado => _creado;
  set creado(bool value) {
    _creado = value;
  }

  String _mensajeID = '';
  String get mensajeID => _mensajeID;
  set mensajeID(String value) {
    _mensajeID = value;
  }

  UserAuthStruct _userAuth = UserAuthStruct();
  UserAuthStruct get userAuth => _userAuth;
  set userAuth(UserAuthStruct value) {
    _userAuth = value;
  }

  void updateUserAuthStruct(Function(UserAuthStruct) updateFn) {
    updateFn(_userAuth);
  }

  bool _textoBool = false;
  bool get textoBool => _textoBool;
  set textoBool(bool value) {
    _textoBool = value;
  }

  String _fotoUrl = '';
  String get fotoUrl => _fotoUrl;
  set fotoUrl(String value) {
    _fotoUrl = value;
  }

  String _idChat = '';
  String get idChat => _idChat;
  set idChat(String value) {
    _idChat = value;
  }

  String _user1 = '';
  String get user1 => _user1;
  set user1(String value) {
    _user1 = value;
  }

  String _user2 = '';
  String get user2 => _user2;
  set user2(String value) {
    _user2 = value;
  }

  bool _vistaChat = false;
  bool get vistaChat => _vistaChat;
  set vistaChat(bool value) {
    _vistaChat = value;
  }

  String _ultimoMensaje = '';
  String get ultimoMensaje => _ultimoMensaje;
  set ultimoMensaje(String value) {
    _ultimoMensaje = value;
    prefs.setString('ff_ultimoMensaje', value);
  }

  bool _busqueda = false;
  bool get busqueda => _busqueda;
  set busqueda(bool value) {
    _busqueda = value;
  }

  String _texto = '';
  String get texto => _texto;
  set texto(String value) {
    _texto = value;
  }

  bool _enviar = false;
  bool get enviar => _enviar;
  set enviar(bool value) {
    _enviar = value;
  }

  bool _dark = false;
  bool get dark => _dark;
  set dark(bool value) {
    _dark = value;
    prefs.setBool('ff_dark', value);
  }

  bool _grabaAudio = false;
  bool get grabaAudio => _grabaAudio;
  set grabaAudio(bool value) {
    _grabaAudio = value;
  }

  bool _enviaAudio = false;
  bool get enviaAudio => _enviaAudio;
  set enviaAudio(bool value) {
    _enviaAudio = value;
  }

  String _audio = '';
  String get audio => _audio;
  set audio(String value) {
    _audio = value;
  }

  bool _record = false;
  bool get record => _record;
  set record(bool value) {
    _record = value;
  }

  bool _timer = false;
  bool get timer => _timer;
  set timer(bool value) {
    _timer = value;
  }

  String _voz = '';
  String get voz => _voz;
  set voz(String value) {
    _voz = value;
  }

  bool _persiana1 = false;
  bool get persiana1 => _persiana1;
  set persiana1(bool value) {
    _persiana1 = value;
  }

  bool _persiana2 = false;
  bool get persiana2 => _persiana2;
  set persiana2(bool value) {
    _persiana2 = value;
  }

  bool _persiana3 = false;
  bool get persiana3 => _persiana3;
  set persiana3(bool value) {
    _persiana3 = value;
  }

  bool _envio = false;
  bool get envio => _envio;
  set envio(bool value) {
    _envio = value;
  }

  String _audioID = '';
  String get audioID => _audioID;
  set audioID(String value) {
    _audioID = value;
  }

  String _audioNOMBRE = '';
  String get audioNOMBRE => _audioNOMBRE;
  set audioNOMBRE(String value) {
    _audioNOMBRE = value;
  }

  String _audioURL = '';
  String get audioURL => _audioURL;
  set audioURL(String value) {
    _audioURL = value;
  }

  bool _persiana4 = false;
  bool get persiana4 => _persiana4;
  set persiana4(bool value) {
    _persiana4 = value;
  }

  dynamic _json;
  dynamic get json => _json;
  set json(dynamic value) {
    _json = value;
  }

  String _fileName = '';
  String get fileName => _fileName;
  set fileName(String value) {
    _fileName = value;
  }

  bool _isFile = false;
  bool get isFile => _isFile;
  set isFile(bool value) {
    _isFile = value;
  }

  String _textoFile = '';
  String get textoFile => _textoFile;
  set textoFile(String value) {
    _textoFile = value;
  }

  String _urlView = '';
  String get urlView => _urlView;
  set urlView(String value) {
    _urlView = value;
  }

  String _imageUrl = '';
  String get imageUrl => _imageUrl;
  set imageUrl(String value) {
    _imageUrl = value;
  }

  String _tipo = '';
  String get tipo => _tipo;
  set tipo(String value) {
    _tipo = value;
  }

  String _pocketBaseName = '';
  String get pocketBaseName => _pocketBaseName;
  set pocketBaseName(String value) {
    _pocketBaseName = value;
  }

  double _tamaoTexto = 0.0;
  double get tamaoTexto => _tamaoTexto;
  set tamaoTexto(double value) {
    _tamaoTexto = value;
    prefs.setDouble('ff_tamaoTexto', value);
  }

  Color _interfazColor = Colors.transparent;
  Color get interfazColor => _interfazColor;
  set interfazColor(Color value) {
    _interfazColor = value;
    prefs.setInt('ff_interfazColor', value.value);
  }

  Color _burbujaColor1 = Colors.transparent;
  Color get burbujaColor1 => _burbujaColor1;
  set burbujaColor1(Color value) {
    _burbujaColor1 = value;
    prefs.setInt('ff_burbujaColor1', value.value);
  }

  Color _burbujaColor2 = Colors.transparent;
  Color get burbujaColor2 => _burbujaColor2;
  set burbujaColor2(Color value) {
    _burbujaColor2 = value;
    prefs.setInt('ff_burbujaColor2', value.value);
  }

  Color _textoInterfazColor = Colors.transparent;
  Color get textoInterfazColor => _textoInterfazColor;
  set textoInterfazColor(Color value) {
    _textoInterfazColor = value;
    prefs.setInt('ff_textoInterfazColor', value.value);
  }

  Color _textoMensajeColor = Colors.transparent;
  Color get textoMensajeColor => _textoMensajeColor;
  set textoMensajeColor(Color value) {
    _textoMensajeColor = value;
    prefs.setInt('ff_textoMensajeColor', value.value);
  }

  Color _textoFechaColor = Colors.transparent;
  Color get textoFechaColor => _textoFechaColor;
  set textoFechaColor(Color value) {
    _textoFechaColor = value;
    prefs.setInt('ff_textoFechaColor', value.value);
  }

  Color _interfazColor2 = Colors.transparent;
  Color get interfazColor2 => _interfazColor2;
  set interfazColor2(Color value) {
    _interfazColor2 = value;
    prefs.setInt('ff_interfazColor2', value.value);
  }

  double _tamano = 0.0;
  double get tamano => _tamano;
  set tamano(double value) {
    _tamano = value;
    prefs.setDouble('ff_tamano', value);
  }

  String _video = '';
  String get video => _video;
  set video(String value) {
    _video = value;
  }

  bool _descargar = false;
  bool get descargar => _descargar;
  set descargar(bool value) {
    _descargar = value;
  }

  String _documentoId = '';
  String get documentoId => _documentoId;
  set documentoId(String value) {
    _documentoId = value;
  }

  String _documentoName = '';
  String get documentoName => _documentoName;
  set documentoName(String value) {
    _documentoName = value;
  }

  double _contrastRatio = 0.0;
  double get contrastRatio => _contrastRatio;
  set contrastRatio(double value) {
    _contrastRatio = value;
    prefs.setDouble('ff_contrastRatio', value);
  }

  bool _enableButtonsDrag = false;
  bool get enableButtonsDrag => _enableButtonsDrag;
  set enableButtonsDrag(bool value) {
    _enableButtonsDrag = value;
  }

  bool _checkFontOverflows = false;
  bool get checkFontOverflows => _checkFontOverflows;
  set checkFontOverflows(bool value) {
    _checkFontOverflows = value;
  }

  bool _checkImageLabels = false;
  bool get checkImageLabels => _checkImageLabels;
  set checkImageLabels(bool value) {
    _checkImageLabels = value;
  }

  bool _checkTextContrast = false;
  bool get checkTextContrast => _checkTextContrast;
  set checkTextContrast(bool value) {
    _checkTextContrast = value;
  }

  bool _checkTapTargets = false;
  bool get checkTapTargets => _checkTapTargets;
  set checkTapTargets(bool value) {
    _checkTapTargets = value;
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
  }

  String _grupoId = '';
  String get grupoId => _grupoId;
  set grupoId(String value) {
    _grupoId = value;
  }

  String _grupoName = '';
  String get grupoName => _grupoName;
  set grupoName(String value) {
    _grupoName = value;
  }

  List<String> _miembrosGrupo = [];
  List<String> get miembrosGrupo => _miembrosGrupo;
  set miembrosGrupo(List<String> value) {
    _miembrosGrupo = value;
  }

  void addToMiembrosGrupo(String value) {
    miembrosGrupo.add(value);
  }

  void removeFromMiembrosGrupo(String value) {
    miembrosGrupo.remove(value);
  }

  void removeAtIndexFromMiembrosGrupo(int index) {
    miembrosGrupo.removeAt(index);
  }

  void updateMiembrosGrupoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    miembrosGrupo[index] = updateFn(_miembrosGrupo[index]);
  }

  void insertAtIndexInMiembrosGrupo(int index, String value) {
    miembrosGrupo.insert(index, value);
  }

  dynamic _miembroGrupo;
  dynamic get miembroGrupo => _miembroGrupo;
  set miembroGrupo(dynamic value) {
    _miembroGrupo = value;
  }

  List<dynamic> _listaMiembrosGrupo = [];
  List<dynamic> get listaMiembrosGrupo => _listaMiembrosGrupo;
  set listaMiembrosGrupo(List<dynamic> value) {
    _listaMiembrosGrupo = value;
  }

  void addToListaMiembrosGrupo(dynamic value) {
    listaMiembrosGrupo.add(value);
  }

  void removeFromListaMiembrosGrupo(dynamic value) {
    listaMiembrosGrupo.remove(value);
  }

  void removeAtIndexFromListaMiembrosGrupo(int index) {
    listaMiembrosGrupo.removeAt(index);
  }

  void updateListaMiembrosGrupoAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    listaMiembrosGrupo[index] = updateFn(_listaMiembrosGrupo[index]);
  }

  void insertAtIndexInListaMiembrosGrupo(int index, dynamic value) {
    listaMiembrosGrupo.insert(index, value);
  }

  String _mensajeGrupoId = '';
  String get mensajeGrupoId => _mensajeGrupoId;
  set mensajeGrupoId(String value) {
    _mensajeGrupoId = value;
  }

  String _miembros = '';
  String get miembros => _miembros;
  set miembros(String value) {
    _miembros = value;
  }

  List<String> _listaMiembros = [];
  List<String> get listaMiembros => _listaMiembros;
  set listaMiembros(List<String> value) {
    _listaMiembros = value;
  }

  void addToListaMiembros(String value) {
    listaMiembros.add(value);
  }

  void removeFromListaMiembros(String value) {
    listaMiembros.remove(value);
  }

  void removeAtIndexFromListaMiembros(int index) {
    listaMiembros.removeAt(index);
  }

  void updateListaMiembrosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaMiembros[index] = updateFn(_listaMiembros[index]);
  }

  void insertAtIndexInListaMiembros(int index, String value) {
    listaMiembros.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
