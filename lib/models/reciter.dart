import 'dart:convert';

import 'package:flutter/services.dart';

class Reciter {
  Reciter({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });
  factory Reciter.fromMap(Map<String, dynamic> json) {
    return Reciter(
      identifier: json['identifier'] as String,
      language: json['language'] as String,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      format: json['format'] as String,
      type: json['type'] as String,
    );
  }

  factory Reciter.fromJson(String source) =>
      Reciter.fromMap(json.decode(source) as Map<String, dynamic>);
  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['language'] = language;
    data['name'] = name;
    data['englishName'] = englishName;
    data['format'] = format;
    data['type'] = type;
    return data;
  }

  String toJson() => jsonEncode(toMap());
}

Future<List<Reciter>> fetchReciters() async {
  final jsonData = await rootBundle.loadString(
    'assets/reciters.json',
  );

  final data = (json.decode(jsonData) as Map)['reciters'] as List;

  final recitersList = data
      .map(
        (e) => Reciter.fromMap(e as Map<String, dynamic>),
      )
      .toList();

  return recitersList;
}
