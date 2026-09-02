import 'package:portfolio_v2/core/models/company.dart';
import 'package:portfolio_v2/core/models/enums/project_status.dart';
import 'package:portfolio_v2/core/models/media.dart';
import 'package:portfolio_v2/core/models/skills.dart';
import 'package:portfolio_v2/core/models/technology.dart';

class Projects {
  final DateTime? date;
  final String title;
  final ProjectStatus? status;
  final String? description;
  final List<Technology>? tech;
  final List<String>? highlight;
  final Company? workedFor;
  final List<Skills>? skills;
  final List<Media>? media;
  const Projects({
    this.date,
    required this.title,
    this.status,
    this.description,
    this.tech,
    this.highlight,
    this.workedFor,
    this.skills,
    this.media,
  });
  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      date: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : null,
      title: json['title'] as String,
      status: json['status'] != null
          ? ProjectStatus.values.byName(json['status'] as String)
          : null,
      description: json['description'] as String?,
      tech: (json['tech'] as List?)
          ?.map((e) => Technology.fromJson(e as Map<String, dynamic>))
          .toList(),
      highlight: (json['highlight'] as List?)?.cast<String>(),
      workedFor: json['workedFor'] != null
          ? Company.fromJson(json['workedFor'] as Map<String, dynamic>)
          : null,
      skills: (json['skills'] as List?)
          ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
          .toList(),
      media: (json['media'] as List?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'date': date?.toIso8601String(),
    'title': title,
    'status': status?.name,
    'description': description,
    'tech': tech?.map((e) => e.toJson()).toList(),
    'highlight': highlight,
    'workedFor': workedFor?.toJson(),
    'skills': skills?.map((e) => e.toJson()).toList(),
    'media': media?.map((e) => e.toJson()).toList(),
  };
  Projects copyWith({
    DateTime? date,
    String? title,
    ProjectStatus? status,
    String? description,
    List<Technology>? tech,
    List<String>? highlight,
    Company? workedFor,
    List<Skills>? skills,
    List<Media>? media,
  }) {
    return Projects(
      date: date ?? this.date,
      title: title ?? this.title,
      status: status ?? this.status,
      description: description ?? this.description,
      tech: tech ?? this.tech,
      highlight: highlight ?? this.highlight,
      workedFor: workedFor ?? this.workedFor,
      skills: skills ?? this.skills,
      media: media ?? this.media,
    );
  }
}
