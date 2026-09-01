import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class Education {
  final String id;
  final String institution;

  final String? degree;
  final String? fieldOfStudy;

  final DateTime? startDate;
  final DateTime? endDate;
  final bool current;

  final String? description;
  final String? location;
  final String? city;
  final String? country;
  final String? website;
  final String? grade;
  final String? gpa;

  final Media? logo;
  final String? logoUrl;

  final List<String>? achievements;
  final List<String>? activities;
  final List<String>? skills;
  final List<Media>? media;

  final int? order;
  final Map<String, dynamic>? metadata;

  const Education({
    required this.id,
    required this.institution,
    this.degree,
    this.fieldOfStudy,
    this.startDate,
    this.endDate,
    this.current = false,
    this.description,
    this.location,
    this.city,
    this.country,
    this.website,
    this.grade,
    this.gpa,
    this.logo,
    this.logoUrl,
    this.achievements,
    this.activities,
    this.skills,
    this.media,
    this.order,
    this.metadata,
  });

  bool get isCurrent => current || (endDate == null && startDate != null);

  /// E.g. "2018 - 2022" or "2020 - Present"
  String get yearRange {
    final start = startDate?.year.toString() ?? '';
    if (isCurrent) return start.isEmpty ? 'Present' : '$start - Present';
    final end = endDate?.year.toString() ?? '';
    if (start.isNotEmpty && end.isNotEmpty) return '$start - $end';
    return start.isNotEmpty ? start : end;
  }

  String? get primaryLogoUrl => logo?.url ?? logoUrl;

  Education copyWith({
    String? id,
    String? institution,
    String? degree,
    String? fieldOfStudy,
    DateTime? startDate,
    DateTime? endDate,
    bool? current,
    String? description,
    String? location,
    String? city,
    String? country,
    String? website,
    String? grade,
    String? gpa,
    Media? logo,
    String? logoUrl,
    List<String>? achievements,
    List<String>? activities,
    List<String>? skills,
    List<Media>? media,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Education(
      id: id ?? this.id,
      institution: institution ?? this.institution,
      degree: degree ?? this.degree,
      fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      current: current ?? this.current,
      description: description ?? this.description,
      location: location ?? this.location,
      city: city ?? this.city,
      country: country ?? this.country,
      website: website ?? this.website,
      grade: grade ?? this.grade,
      gpa: gpa ?? this.gpa,
      logo: logo ?? this.logo,
      logoUrl: logoUrl ?? this.logoUrl,
      achievements: achievements ?? this.achievements,
      activities: activities ?? this.activities,
      skills: skills ?? this.skills,
      media: media ?? this.media,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'institution': institution,
      if (degree != null) 'degree': degree,
      if (fieldOfStudy != null) 'fieldOfStudy': fieldOfStudy,
      if (startDate != null) 'startDate': ModelParsingHelpers.dateTimeToJson(startDate),
      if (endDate != null) 'endDate': ModelParsingHelpers.dateTimeToJson(endDate),
      'current': current,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (website != null) 'website': website,
      if (grade != null) 'grade': grade,
      if (gpa != null) 'gpa': gpa,
      if (logo != null) 'logo': logo!.toMap(),
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (achievements != null) 'achievements': achievements,
      if (activities != null) 'activities': activities,
      if (skills != null) 'skills': skills,
      if (media != null) 'media': media!.map((m) => m.toMap()).toList(),
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id']?.toString() ?? '',
      institution: map['institution']?.toString() ?? '',
      degree: map['degree']?.toString(),
      fieldOfStudy: map['fieldOfStudy']?.toString(),
      startDate: ModelParsingHelpers.parseDateTime(map['startDate']),
      endDate: ModelParsingHelpers.parseDateTime(map['endDate']),
      current: ModelParsingHelpers.parseBool(map['current']) ?? false,
      description: map['description']?.toString(),
      location: map['location']?.toString(),
      city: map['city']?.toString(),
      country: map['country']?.toString(),
      website: map['website']?.toString(),
      grade: map['grade']?.toString(),
      gpa: map['gpa']?.toString(),
      logo: map['logo'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['logo'] as Map))
          : null,
      logoUrl: map['logoUrl']?.toString(),
      achievements: ModelParsingHelpers.parseStringList(map['achievements']),
      activities: ModelParsingHelpers.parseStringList(map['activities']),
      skills: ModelParsingHelpers.parseStringList(map['skills']),
      media: ModelParsingHelpers.parseObjectList(map['media'], Media.fromMap),
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(Map<String, dynamic> json) => Education.fromMap(json);

  factory Education.fromJsonString(String source) =>
      Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Education(id: $id, institution: $institution, degree: $degree, fieldOfStudy: $fieldOfStudy, yearRange: $yearRange)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Education &&
        other.id == id &&
        other.institution == institution &&
        other.degree == degree &&
        other.fieldOfStudy == fieldOfStudy &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.current == current &&
        other.description == description &&
        other.location == location &&
        other.city == city &&
        other.country == country &&
        other.website == website &&
        other.grade == grade &&
        other.gpa == gpa &&
        other.logo == logo &&
        other.logoUrl == logoUrl &&
        listEquals(other.achievements, achievements) &&
        listEquals(other.activities, activities) &&
        listEquals(other.skills, skills) &&
        listEquals(other.media, media) &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      institution,
      degree,
      fieldOfStudy,
      startDate,
      endDate,
      current,
      description,
      location,
      city,
      country,
      website,
      grade,
      gpa,
      logo,
      logoUrl,
      achievements == null ? null : Object.hashAll(achievements!),
      activities == null ? null : Object.hashAll(activities!),
      skills == null ? null : Object.hashAll(skills!),
      media == null ? null : Object.hashAll(media!),
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    ]);
  }
}