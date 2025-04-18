import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

dynamic formatoJson(dynamic json) {
  final encoder = JsonEncoder.withIndent('  '); // 2 spaces for indentation
  return encoder.convert(json);
}

String? typeType(
  String name,
  List<String> listName,
) {
  // If name is in list name returns string if it is not it returns nothing
  return listName.contains(name) ? name : null;
}
