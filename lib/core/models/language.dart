import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'enums/language_proficiency.dart';
import 'helpers/model_parsing_helpers.dart';

@immutable
class Language {
  final String id;
  final String name;
  final String? code;
  final LanguageProficiency? proficiency;
  final bool isNative;
  final int? order;
  final Map<String, dynamic>? metadata;

  const Language({
    required this.id,
    required this.name,
    this.code,
    this.proficiency,
    this.isNative = false,
    this.order,
    this.metadata,
  });

  Language copyWith({
    String? id,
    String? name,
    String? code,
    LanguageProficiency? proficiency,
    bool? isNative,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      proficiency: proficiency ?? this.proficiency,
      isNative: isNative ?? this.isNative,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      if (code != null) 'code': code,
      if (proficiency != null) 'proficiency': proficiency!.toJson(),
      'isNative': isNative,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      code: map['code']?.toString(),
      proficiency: map['proficiency'] != null
          ? LanguageProficiency.fromString(map['proficiency']?.toString())
          : null,
      isNative: ModelParsingHelpers.parseBool(map['isNative']) ?? false,
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(Map<String, dynamic> json) => Language.fromMap(json);

  factory Language.fromJsonString(String source) =>
      Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Language(id: $id, name: $name, code: $code, proficiency: $proficiency, isNative: $isNative, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Language &&
        other.id == id &&
        other.name == name &&
        other.code == code &&
        other.proficiency == proficiency &&
        other.isNative == isNative &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      code,
      proficiency,
      isNative,
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    );
  }
}
