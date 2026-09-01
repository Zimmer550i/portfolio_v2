import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'company.dart';
import 'enums/employment_type.dart';
import 'experience_highlight.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';
import 'project.dart';

@immutable
class Experience {
  final String id;
  final String title;

  final EmploymentType? employmentType;

  final DateTime startDate;
  final DateTime? endDate;

  /// True when this is the user's current position.
  final bool current;

  final Company? company;
  final String? companyName;
  final Media? companyLogo;
  final String? companyLogoUrl;

  final String? summary;
  final String? description;

  final String? location;
  final String? locationType;
  final bool? remote;

  final String? department;
  final String? team;
  final String? website;

  final List<String>? skills;
  final List<String>? technologies;

  final List<String>? achievements;
  final List<String>? responsibilities;

  final List<ExperienceHighlight>? highlights;

  /// Projects worked on during this experience.
  final List<Project>? projects;

  final List<Media>? media;

  final int? order;
  final Map<String, dynamic>? metadata;

  const Experience({
    required this.id,
    required this.title,
    required this.startDate,
    this.employmentType,
    this.endDate,
    this.current = false,
    this.company,
    this.companyName,
    this.companyLogo,
    this.companyLogoUrl,
    this.summary,
    this.description,
    this.location,
    this.locationType,
    this.remote,
    this.department,
    this.team,
    this.website,
    this.skills,
    this.technologies,
    this.achievements,
    this.responsibilities,
    this.highlights,
    this.projects,
    this.media,
    this.order,
    this.metadata,
  });

  bool get isCurrent => current || endDate == null;

  String? get primaryCompanyName => company?.name ?? companyName;
  String? get primaryCompanyLogoUrl => company?.primaryLogoUrl ?? companyLogo?.url ?? companyLogoUrl;

  /// Year range e.g. "2021 - Present" or "2019 - 2021"
  String get yearRange {
    final start = startDate.year.toString();
    if (isCurrent) return '$start - Present';
    final end = endDate?.year.toString() ?? 'Present';
    return '$start - $end';
  }

  /// Calculates total months between startDate and endDate (or now).
  int get durationInMonths {
    final finish = isCurrent ? DateTime.now() : (endDate ?? DateTime.now());
    final years = finish.year - startDate.year;
    final months = finish.month - startDate.month;
    final total = years * 12 + months;
    return total < 1 ? 1 : total;
  }

  /// Human-readable duration e.g. "2 yrs 4 mos" or "6 mos".
  String get durationFormatted {
    final totalMonths = durationInMonths;
    final years = totalMonths ~/ 12;
    final months = totalMonths % 12;
    if (years > 0 && months > 0) {
      return '$years yr${years > 1 ? 's' : ''} $months mo${months > 1 ? 's' : ''}';
    } else if (years > 0) {
      return '$years yr${years > 1 ? 's' : ''}';
    } else {
      return '$months mo${months > 1 ? 's' : ''}';
    }
  }

  Experience copyWith({
    String? id,
    String? title,
    EmploymentType? employmentType,
    DateTime? startDate,
    DateTime? endDate,
    bool? current,
    Company? company,
    String? companyName,
    Media? companyLogo,
    String? companyLogoUrl,
    String? summary,
    String? description,
    String? location,
    String? locationType,
    bool? remote,
    String? department,
    String? team,
    String? website,
    List<String>? skills,
    List<String>? technologies,
    List<String>? achievements,
    List<String>? responsibilities,
    List<ExperienceHighlight>? highlights,
    List<Project>? projects,
    List<Media>? media,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Experience(
      id: id ?? this.id,
      title: title ?? this.title,
      employmentType: employmentType ?? this.employmentType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      current: current ?? this.current,
      company: company ?? this.company,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      companyLogoUrl: companyLogoUrl ?? this.companyLogoUrl,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      location: location ?? this.location,
      locationType: locationType ?? this.locationType,
      remote: remote ?? this.remote,
      department: department ?? this.department,
      team: team ?? this.team,
      website: website ?? this.website,
      skills: skills ?? this.skills,
      technologies: technologies ?? this.technologies,
      achievements: achievements ?? this.achievements,
      responsibilities: responsibilities ?? this.responsibilities,
      highlights: highlights ?? this.highlights,
      projects: projects ?? this.projects,
      media: media ?? this.media,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      if (employmentType != null) 'employmentType': employmentType!.toJson(),
      'startDate': ModelParsingHelpers.dateTimeToJson(startDate),
      if (endDate != null) 'endDate': ModelParsingHelpers.dateTimeToJson(endDate),
      'current': current,
      if (company != null) 'company': company!.toMap(),
      if (companyName != null) 'companyName': companyName,
      if (companyLogo != null) 'companyLogo': companyLogo!.toMap(),
      if (companyLogoUrl != null) 'companyLogoUrl': companyLogoUrl,
      if (summary != null) 'summary': summary,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (locationType != null) 'locationType': locationType,
      if (remote != null) 'remote': remote,
      if (department != null) 'department': department,
      if (team != null) 'team': team,
      if (website != null) 'website': website,
      if (skills != null) 'skills': skills,
      if (technologies != null) 'technologies': technologies,
      if (achievements != null) 'achievements': achievements,
      if (responsibilities != null) 'responsibilities': responsibilities,
      if (highlights != null)
        'highlights': highlights!.map((h) => h.toMap()).toList(),
      if (projects != null)
        'projects': projects!.map((p) => p.toMap()).toList(),
      if (media != null) 'media': media!.map((m) => m.toMap()).toList(),
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      employmentType: map['employmentType'] != null
          ? EmploymentType.fromString(map['employmentType']?.toString())
          : null,
      startDate: ModelParsingHelpers.parseDateTime(map['startDate']) ?? DateTime.now(),
      endDate: ModelParsingHelpers.parseDateTime(map['endDate']),
      current: ModelParsingHelpers.parseBool(map['current']) ?? false,
      company: map['company'] is Map
          ? Company.fromMap(Map<String, dynamic>.from(map['company'] as Map))
          : null,
      companyName: map['companyName']?.toString(),
      companyLogo: map['companyLogo'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['companyLogo'] as Map))
          : null,
      companyLogoUrl: map['companyLogoUrl']?.toString(),
      summary: map['summary']?.toString(),
      description: map['description']?.toString(),
      location: map['location']?.toString(),
      locationType: map['locationType']?.toString(),
      remote: ModelParsingHelpers.parseBool(map['remote']),
      department: map['department']?.toString(),
      team: map['team']?.toString(),
      website: map['website']?.toString(),
      skills: ModelParsingHelpers.parseStringList(map['skills']),
      technologies: ModelParsingHelpers.parseStringList(map['technologies']),
      achievements: ModelParsingHelpers.parseStringList(map['achievements']),
      responsibilities: ModelParsingHelpers.parseStringList(map['responsibilities']),
      highlights: ModelParsingHelpers.parseObjectList(
        map['highlights'],
        ExperienceHighlight.fromMap,
      ),
      projects: ModelParsingHelpers.parseObjectList(
        map['projects'],
        Project.fromMap,
      ),
      media: ModelParsingHelpers.parseObjectList(map['media'], Media.fromMap),
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Experience.fromJson(Map<String, dynamic> json) =>
      Experience.fromMap(json);

  factory Experience.fromJsonString(String source) =>
      Experience.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Experience(id: $id, title: $title, company: $primaryCompanyName, yearRange: $yearRange)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Experience &&
        other.id == id &&
        other.title == title &&
        other.employmentType == employmentType &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.current == current &&
        other.company == company &&
        other.companyName == companyName &&
        other.companyLogo == companyLogo &&
        other.companyLogoUrl == companyLogoUrl &&
        other.summary == summary &&
        other.description == description &&
        other.location == location &&
        other.locationType == locationType &&
        other.remote == remote &&
        other.department == department &&
        other.team == team &&
        other.website == website &&
        listEquals(other.skills, skills) &&
        listEquals(other.technologies, technologies) &&
        listEquals(other.achievements, achievements) &&
        listEquals(other.responsibilities, responsibilities) &&
        listEquals(other.highlights, highlights) &&
        listEquals(other.projects, projects) &&
        listEquals(other.media, media) &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      title,
      employmentType,
      startDate,
      endDate,
      current,
      company,
      companyName,
      companyLogo,
      companyLogoUrl,
      summary,
      description,
      location,
      locationType,
      remote,
      department,
      team,
      website,
      skills == null ? null : Object.hashAll(skills!),
      technologies == null ? null : Object.hashAll(technologies!),
    ]);
  }
}