import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class Certification {
  final String id;
  final String name;

  final String? issuer;
  final DateTime? issueDate;
  final DateTime? expirationDate;
  final bool doesNotExpire;

  final String? credentialId;
  final String? credentialUrl;
  final String? verificationUrl;

  final String? description;
  final List<String>? skills;

  final Media? image;
  final String? imageUrl;

  final int? order;
  final Map<String, dynamic>? metadata;

  const Certification({
    required this.id,
    required this.name,
    this.issuer,
    this.issueDate,
    this.expirationDate,
    this.doesNotExpire = false,
    this.credentialId,
    this.credentialUrl,
    this.verificationUrl,
    this.description,
    this.skills,
    this.image,
    this.imageUrl,
    this.order,
    this.metadata,
  });

  bool get hasExpiration => !doesNotExpire && expirationDate != null;

  bool get isExpired {
    if (doesNotExpire || expirationDate == null) return false;
    return DateTime.now().isAfter(expirationDate!);
  }

  bool get isValid => !isExpired;

  String? get primaryImageUrl => image?.url ?? imageUrl;
  String? get primaryCredentialUrl => credentialUrl ?? verificationUrl;

  Certification copyWith({
    String? id,
    String? name,
    String? issuer,
    DateTime? issueDate,
    DateTime? expirationDate,
    bool? doesNotExpire,
    String? credentialId,
    String? credentialUrl,
    String? verificationUrl,
    String? description,
    List<String>? skills,
    Media? image,
    String? imageUrl,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Certification(
      id: id ?? this.id,
      name: name ?? this.name,
      issuer: issuer ?? this.issuer,
      issueDate: issueDate ?? this.issueDate,
      expirationDate: expirationDate ?? this.expirationDate,
      doesNotExpire: doesNotExpire ?? this.doesNotExpire,
      credentialId: credentialId ?? this.credentialId,
      credentialUrl: credentialUrl ?? this.credentialUrl,
      verificationUrl: verificationUrl ?? this.verificationUrl,
      description: description ?? this.description,
      skills: skills ?? this.skills,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      if (issuer != null) 'issuer': issuer,
      if (issueDate != null) 'issueDate': ModelParsingHelpers.dateTimeToJson(issueDate),
      if (expirationDate != null)
        'expirationDate': ModelParsingHelpers.dateTimeToJson(expirationDate),
      'doesNotExpire': doesNotExpire,
      if (credentialId != null) 'credentialId': credentialId,
      if (credentialUrl != null) 'credentialUrl': credentialUrl,
      if (verificationUrl != null) 'verificationUrl': verificationUrl,
      if (description != null) 'description': description,
      if (skills != null) 'skills': skills,
      if (image != null) 'image': image!.toMap(),
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Certification.fromMap(Map<String, dynamic> map) {
    return Certification(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      issuer: map['issuer']?.toString(),
      issueDate: ModelParsingHelpers.parseDateTime(map['issueDate']),
      expirationDate: ModelParsingHelpers.parseDateTime(map['expirationDate']),
      doesNotExpire: ModelParsingHelpers.parseBool(map['doesNotExpire']) ?? false,
      credentialId: map['credentialId']?.toString(),
      credentialUrl: map['credentialUrl']?.toString(),
      verificationUrl: map['verificationUrl']?.toString(),
      description: map['description']?.toString(),
      skills: ModelParsingHelpers.parseStringList(map['skills']),
      image: map['image'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['image'] as Map))
          : null,
      imageUrl: map['imageUrl']?.toString(),
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Certification.fromJson(Map<String, dynamic> json) =>
      Certification.fromMap(json);

  factory Certification.fromJsonString(String source) =>
      Certification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Certification(id: $id, name: $name, issuer: $issuer, issueDate: $issueDate, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Certification &&
        other.id == id &&
        other.name == name &&
        other.issuer == issuer &&
        other.issueDate == issueDate &&
        other.expirationDate == expirationDate &&
        other.doesNotExpire == doesNotExpire &&
        other.credentialId == credentialId &&
        other.credentialUrl == credentialUrl &&
        other.verificationUrl == verificationUrl &&
        other.description == description &&
        listEquals(other.skills, skills) &&
        other.image == image &&
        other.imageUrl == imageUrl &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      name,
      issuer,
      issueDate,
      expirationDate,
      doesNotExpire,
      credentialId,
      credentialUrl,
      verificationUrl,
      description,
      skills == null ? null : Object.hashAll(skills!),
      image,
      imageUrl,
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    ]);
  }
}