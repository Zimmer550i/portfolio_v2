import 'package:portfolio_v2/core/models/achievements.dart';
import 'package:portfolio_v2/core/models/education.dart';
import 'package:portfolio_v2/core/models/experience.dart';
import 'package:portfolio_v2/core/models/language.dart';
import 'package:portfolio_v2/core/models/link.dart';
import 'package:portfolio_v2/core/models/project.dart';
import 'package:portfolio_v2/core/models/skills.dart';

class Person {
  final String name;
  final String? imgAsset;
  final String? cvAsset;
  final String? email;
  final String? highlight;
  final String? summery;
  final List<Skills>? skills;
  final List<Expereince>? expereince;
  final List<Projects>? projects;
  final List<Link>? social;
  final List<Language>? languages;
  final List<Education>? education;
  final List<Achievements>? achievements;
  const Person({
    required this.name,
    this.imgAsset,
    this.cvAsset,
    this.email,
    this.highlight,
    this.summery,
    this.skills,
    this.expereince,
    this.projects,
    this.social,
    this.languages,
    this.education,
    this.achievements,
  });
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'] as String,
      imgAsset: json['imgAsset'] as String?,
      cvAsset: json['cvAsset'] as String?,
      email: json['email'] as String?,
      highlight: json['highlight'] as String?,
      summery: json['summery'] as String?,
      skills: (json['skills'] as List?)
          ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
          .toList(),
      expereince: (json['expereince'] as List?)
          ?.map((e) => Expereince.fromJson(e as Map<String, dynamic>))
          .toList(),
      projects: (json['projects'] as List?)
          ?.map((e) => Projects.fromJson(e as Map<String, dynamic>))
          .toList(),
      social: (json['social'] as List?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      achievements: (json['achievements'] as List?)
          ?.map((e) => Achievements.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'name': name,
    'imgAsset': imgAsset,
    'cvAsset': cvAsset,
    'email': email,
    'highlight': highlight,
    'summery': summery,
    'skills': skills?.map((e) => e.toJson()).toList(),
    'expereince': expereince?.map((e) => e.toJson()).toList(),
    'projects': projects?.map((e) => e.toJson()).toList(),
    'social': social?.map((e) => e.toJson()).toList(),
    'languages': languages?.map((e) => e.toJson()).toList(),
    'education': education?.map((e) => e.toJson()).toList(),
    'achievements': achievements?.map((e) => e.toJson()).toList(),
  };
  Person copyWith({
    String? name,
    String? imgAsset,
    String? cvAsset,
    String? email,
    String? highlight,
    String? summery,
    List<Skills>? skills,
    List<Expereince>? expereince,
    List<Projects>? projects,
    List<Link>? social,
    List<Language>? languages,
    List<Education>? education,
    List<Achievements>? achievements,
  }) {
    return Person(
      name: name ?? this.name,
      imgAsset: imgAsset ?? this.imgAsset,
      cvAsset: cvAsset ?? this.cvAsset,
      email: email ?? this.email,
      highlight: highlight ?? this.highlight,
      summery: summery ?? this.summery,
      skills: skills ?? this.skills,
      expereince: expereince ?? this.expereince,
      projects: projects ?? this.projects,
      social: social ?? this.social,
      languages: languages ?? this.languages,
      education: education ?? this.education,
      achievements: achievements ?? this.achievements,
    );
  }
}
