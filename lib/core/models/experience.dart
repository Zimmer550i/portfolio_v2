import 'package:portfolio_v2/core/models/company.dart';
import 'package:portfolio_v2/core/models/enums/expereince_type.dart';
import 'package:portfolio_v2/core/models/media.dart';
import 'package:portfolio_v2/core/models/project.dart';
import 'package:portfolio_v2/core/models/skills.dart';

class Expereince {
  final ExperienceType? type;
  final Company company;
  final List<Projects>? projects;
  final String? description;
  final DateTime startDate;
  final DateTime? endDate;
  final List<Skills>? skills;
  final List<Media>? media;
  final bool? isRemote;
  final List<String>? highlight;
  const Expereince({
    this.type,
    required this.company,
    this.projects,
    this.description,
    required this.startDate,
    this.endDate,
    this.skills,
    this.media,
    this.isRemote,
    this.highlight,
  });
  factory Expereince.fromJson(Map<String, dynamic> json) {
    return Expereince(
      type: json['type'] != null
          ? ExperienceType.values.byName(json['type'] as String)
          : null,
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      projects: (json['projects'] as List?)
          ?.map((e) => Projects.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      skills: (json['skills'] as List?)
          ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
          .toList(),
      media: (json['media'] as List?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      isRemote: json['isRemote'] as bool?,
      highlight: (json['highlight'] as List?)?.cast<String>(),
    );
  }
  Map<String, dynamic> toJson() => {
    'type': type?.name,
    'company': company.toJson(),
    'projects': projects?.map((e) => e.toJson()).toList(),
    'description': description,
    'startDate': startDate.toIso8601String(),
    'endDate': endDate?.toIso8601String(),
    'skills': skills?.map((e) => e.toJson()).toList(),
    'media': media?.map((e) => e.toJson()).toList(),
    'isRemote': isRemote,
    'highlight': highlight,
  };
  Expereince copyWith({
    ExperienceType? type,
    Company? company,
    List<Projects>? projects,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    List<Skills>? skills,
    List<Media>? media,
    bool? isRemote,
    List<String>? highlight,
  }) {
    return Expereince(
      type: type ?? this.type,
      company: company ?? this.company,
      projects: projects ?? this.projects,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      skills: skills ?? this.skills,
      media: media ?? this.media,
      isRemote: isRemote ?? this.isRemote,
      highlight: highlight ?? this.highlight,
    );
  }
}
