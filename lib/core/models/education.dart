import 'package:portfolio_v2/core/models/achievements.dart';
import 'package:portfolio_v2/core/models/media.dart';
import 'package:portfolio_v2/core/models/skills.dart';

class Education {
  final String instituteName;
  final String? degree;
  final String? course;
  final String? dateOfCompletion;
  final List<Media>? media;
  final List<Achievements>? achievements;
  final List<Skills>? skills;
  const Education({
    required this.instituteName,
    this.degree,
    this.course,
    this.dateOfCompletion,
    this.media,
    this.achievements,
    this.skills,
  });
  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      instituteName: json['instituteName'] as String,
      degree: json['degree'] as String?,
      course: json['course'] as String?,
      dateOfCompletion: json['dateOfCompletion'] as String?,
      media: (json['media'] as List?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      achievements: (json['achievements'] as List?)
          ?.map((e) => Achievements.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List?)
          ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'instituteName': instituteName,
    'degree': degree,
    'course': course,
    'dateOfCompletion': dateOfCompletion,
    'media': media?.map((e) => e.toJson()).toList(),
    'achievements': achievements?.map((e) => e.toJson()).toList(),
    'skills': skills?.map((e) => e.toJson()).toList(),
  };
  Education copyWith({
    String? instituteName,
    String? degree,
    String? course,
    String? dateOfCompletion,
    List<Media>? media,
    List<Achievements>? achievements,
    List<Skills>? skills,
  }) {
    return Education(
      instituteName: instituteName ?? this.instituteName,
      degree: degree ?? this.degree,
      course: course ?? this.course,
      dateOfCompletion: dateOfCompletion ?? this.dateOfCompletion,
      media: media ?? this.media,
      achievements: achievements ?? this.achievements,
      skills: skills ?? this.skills,
    );
  }
}
