import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'company.dart';
import 'enums/project_status.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';
import 'project_highlight.dart';

@immutable
class Project {
  final String id;
  final String title;
  final int year;

  final DateTime? startDate;
  final DateTime? endDate;

  final String? slug;
  final String? shortDescription;
  final String? description;

  /// The company this project was done for/with (null can represent a personal project).
  final Company? company;

  /// Your role in the project (e.g. "Lead Mobile Engineer").
  final String? role;

  /// The actual client, if different from the company.
  final String? client;

  /// Category (e.g. "Mobile Apps", "Web Apps", "AI & ML", "Open Source").
  final String? category;

  /// Target platforms (e.g. ["iOS", "Android", "Web", "macOS"]).
  final List<String>? platforms;

  /// Architecture used (e.g. "Clean Architecture + BLoC").
  final String? architecture;

  final ProjectStatus? status;

  final List<Media>? media;
  final Media? bannerImage;
  final String? bannerImageUrl;

  final List<String>? technologies;
  final List<String>? skills;

  final List<ProjectHighlight>? highlights;

  // Case study information
  final String? challenge;
  final String? solution;
  final String? result;
  final String? learnings;

  final String? responsibilities;
  final List<String>? achievements;

  // External resources
  final String? url;
  final String? repositoryUrl;
  final String? caseStudyUrl;
  final String? demoUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? figmaUrl;
  final String? docsUrl;

  final String? location;
  final String? duration;
  final int? teamSize;

  final bool featured;
  final int? order;

  final String? notes;
  final Map<String, dynamic>? metadata;

  const Project({
    required this.id,
    required this.title,
    required this.year,
    this.startDate,
    this.endDate,
    this.slug,
    this.shortDescription,
    this.description,
    this.company,
    this.role,
    this.client,
    this.category,
    this.platforms,
    this.architecture,
    this.status,
    this.media,
    this.bannerImage,
    this.bannerImageUrl,
    this.technologies,
    this.skills,
    this.highlights,
    this.challenge,
    this.solution,
    this.result,
    this.learnings,
    this.responsibilities,
    this.achievements,
    this.url,
    this.repositoryUrl,
    this.caseStudyUrl,
    this.demoUrl,
    this.appStoreUrl,
    this.playStoreUrl,
    this.figmaUrl,
    this.docsUrl,
    this.location,
    this.duration,
    this.teamSize,
    this.featured = false,
    this.order,
    this.notes,
    this.metadata,
  });

  bool get isCompleted => status == ProjectStatus.completed;
  bool get isOngoing => status == ProjectStatus.ongoing || status == ProjectStatus.inProgress;
  bool get hasCaseStudy =>
      caseStudyUrl != null ||
      (challenge != null && challenge!.isNotEmpty) ||
      (solution != null && solution!.isNotEmpty);

  String? get primaryUrl => url ?? demoUrl ?? repositoryUrl ?? caseStudyUrl;
  String? get primaryImageUrl =>
      bannerImage?.url ?? bannerImageUrl ?? (media?.isNotEmpty == true ? media!.first.url : null);

  Project copyWith({
    String? id,
    String? title,
    int? year,
    DateTime? startDate,
    DateTime? endDate,
    String? slug,
    String? shortDescription,
    String? description,
    Company? company,
    String? role,
    String? client,
    String? category,
    List<String>? platforms,
    String? architecture,
    ProjectStatus? status,
    List<Media>? media,
    Media? bannerImage,
    String? bannerImageUrl,
    List<String>? technologies,
    List<String>? skills,
    List<ProjectHighlight>? highlights,
    String? challenge,
    String? solution,
    String? result,
    String? learnings,
    String? responsibilities,
    List<String>? achievements,
    String? url,
    String? repositoryUrl,
    String? caseStudyUrl,
    String? demoUrl,
    String? appStoreUrl,
    String? playStoreUrl,
    String? figmaUrl,
    String? docsUrl,
    String? location,
    String? duration,
    int? teamSize,
    bool? featured,
    int? order,
    String? notes,
    Map<String, dynamic>? metadata,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      slug: slug ?? this.slug,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      company: company ?? this.company,
      role: role ?? this.role,
      client: client ?? this.client,
      category: category ?? this.category,
      platforms: platforms ?? this.platforms,
      architecture: architecture ?? this.architecture,
      status: status ?? this.status,
      media: media ?? this.media,
      bannerImage: bannerImage ?? this.bannerImage,
      bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
      technologies: technologies ?? this.technologies,
      skills: skills ?? this.skills,
      highlights: highlights ?? this.highlights,
      challenge: challenge ?? this.challenge,
      solution: solution ?? this.solution,
      result: result ?? this.result,
      learnings: learnings ?? this.learnings,
      responsibilities: responsibilities ?? this.responsibilities,
      achievements: achievements ?? this.achievements,
      url: url ?? this.url,
      repositoryUrl: repositoryUrl ?? this.repositoryUrl,
      caseStudyUrl: caseStudyUrl ?? this.caseStudyUrl,
      demoUrl: demoUrl ?? this.demoUrl,
      appStoreUrl: appStoreUrl ?? this.appStoreUrl,
      playStoreUrl: playStoreUrl ?? this.playStoreUrl,
      figmaUrl: figmaUrl ?? this.figmaUrl,
      docsUrl: docsUrl ?? this.docsUrl,
      location: location ?? this.location,
      duration: duration ?? this.duration,
      teamSize: teamSize ?? this.teamSize,
      featured: featured ?? this.featured,
      order: order ?? this.order,
      notes: notes ?? this.notes,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'year': year,
      if (startDate != null) 'startDate': ModelParsingHelpers.dateTimeToJson(startDate),
      if (endDate != null) 'endDate': ModelParsingHelpers.dateTimeToJson(endDate),
      if (slug != null) 'slug': slug,
      if (shortDescription != null) 'shortDescription': shortDescription,
      if (description != null) 'description': description,
      if (company != null) 'company': company!.toMap(),
      if (role != null) 'role': role,
      if (client != null) 'client': client,
      if (category != null) 'category': category,
      if (platforms != null) 'platforms': platforms,
      if (architecture != null) 'architecture': architecture,
      if (status != null) 'status': status!.toJson(),
      if (media != null) 'media': media!.map((m) => m.toMap()).toList(),
      if (bannerImage != null) 'bannerImage': bannerImage!.toMap(),
      if (bannerImageUrl != null) 'bannerImageUrl': bannerImageUrl,
      if (technologies != null) 'technologies': technologies,
      if (skills != null) 'skills': skills,
      if (highlights != null)
        'highlights': highlights!.map((h) => h.toMap()).toList(),
      if (challenge != null) 'challenge': challenge,
      if (solution != null) 'solution': solution,
      if (result != null) 'result': result,
      if (learnings != null) 'learnings': learnings,
      if (responsibilities != null) 'responsibilities': responsibilities,
      if (achievements != null) 'achievements': achievements,
      if (url != null) 'url': url,
      if (repositoryUrl != null) 'repositoryUrl': repositoryUrl,
      if (caseStudyUrl != null) 'caseStudyUrl': caseStudyUrl,
      if (demoUrl != null) 'demoUrl': demoUrl,
      if (appStoreUrl != null) 'appStoreUrl': appStoreUrl,
      if (playStoreUrl != null) 'playStoreUrl': playStoreUrl,
      if (figmaUrl != null) 'figmaUrl': figmaUrl,
      if (docsUrl != null) 'docsUrl': docsUrl,
      if (location != null) 'location': location,
      if (duration != null) 'duration': duration,
      if (teamSize != null) 'teamSize': teamSize,
      'featured': featured,
      if (order != null) 'order': order,
      if (notes != null) 'notes': notes,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      year: ModelParsingHelpers.parseInt(map['year']) ?? DateTime.now().year,
      startDate: ModelParsingHelpers.parseDateTime(map['startDate']),
      endDate: ModelParsingHelpers.parseDateTime(map['endDate']),
      slug: map['slug']?.toString(),
      shortDescription: map['shortDescription']?.toString(),
      description: map['description']?.toString(),
      company: map['company'] is Map
          ? Company.fromMap(Map<String, dynamic>.from(map['company'] as Map))
          : null,
      role: map['role']?.toString(),
      client: map['client']?.toString(),
      category: map['category']?.toString(),
      platforms: ModelParsingHelpers.parseStringList(map['platforms']),
      architecture: map['architecture']?.toString(),
      status: map['status'] != null
          ? ProjectStatus.fromString(map['status']?.toString())
          : null,
      media: ModelParsingHelpers.parseObjectList(map['media'], Media.fromMap),
      bannerImage: map['bannerImage'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['bannerImage'] as Map))
          : null,
      bannerImageUrl: map['bannerImageUrl']?.toString(),
      technologies: ModelParsingHelpers.parseStringList(map['technologies']),
      skills: ModelParsingHelpers.parseStringList(map['skills']),
      highlights: ModelParsingHelpers.parseObjectList(
        map['highlights'],
        ProjectHighlight.fromMap,
      ),
      challenge: map['challenge']?.toString(),
      solution: map['solution']?.toString(),
      result: map['result']?.toString(),
      learnings: map['learnings']?.toString(),
      responsibilities: map['responsibilities']?.toString(),
      achievements: ModelParsingHelpers.parseStringList(map['achievements']),
      url: map['url']?.toString(),
      repositoryUrl: map['repositoryUrl']?.toString(),
      caseStudyUrl: map['caseStudyUrl']?.toString(),
      demoUrl: map['demoUrl']?.toString(),
      appStoreUrl: map['appStoreUrl']?.toString(),
      playStoreUrl: map['playStoreUrl']?.toString(),
      figmaUrl: map['figmaUrl']?.toString(),
      docsUrl: map['docsUrl']?.toString(),
      location: map['location']?.toString(),
      duration: map['duration']?.toString(),
      teamSize: ModelParsingHelpers.parseInt(map['teamSize']),
      featured: ModelParsingHelpers.parseBool(map['featured']) ?? false,
      order: ModelParsingHelpers.parseInt(map['order']),
      notes: map['notes']?.toString(),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(Map<String, dynamic> json) => Project.fromMap(json);

  factory Project.fromJsonString(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(id: $id, title: $title, year: $year, category: $category, status: $status, featured: $featured)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project &&
        other.id == id &&
        other.title == title &&
        other.year == year &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.slug == slug &&
        other.shortDescription == shortDescription &&
        other.description == description &&
        other.company == company &&
        other.role == role &&
        other.client == client &&
        other.category == category &&
        listEquals(other.platforms, platforms) &&
        other.architecture == architecture &&
        other.status == status &&
        listEquals(other.media, media) &&
        other.bannerImage == bannerImage &&
        other.bannerImageUrl == bannerImageUrl &&
        listEquals(other.technologies, technologies) &&
        listEquals(other.skills, skills) &&
        listEquals(other.highlights, highlights) &&
        other.challenge == challenge &&
        other.solution == solution &&
        other.result == result &&
        other.learnings == learnings &&
        other.responsibilities == responsibilities &&
        listEquals(other.achievements, achievements) &&
        other.url == url &&
        other.repositoryUrl == repositoryUrl &&
        other.caseStudyUrl == caseStudyUrl &&
        other.demoUrl == demoUrl &&
        other.appStoreUrl == appStoreUrl &&
        other.playStoreUrl == playStoreUrl &&
        other.figmaUrl == figmaUrl &&
        other.docsUrl == docsUrl &&
        other.location == location &&
        other.duration == duration &&
        other.teamSize == teamSize &&
        other.featured == featured &&
        other.order == order &&
        other.notes == notes &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      title,
      year,
      startDate,
      endDate,
      slug,
      shortDescription,
      description,
      company,
      role,
      client,
      category,
      platforms == null ? null : Object.hashAll(platforms!),
      architecture,
      status,
      media == null ? null : Object.hashAll(media!),
      bannerImage,
      bannerImageUrl,
      technologies == null ? null : Object.hashAll(technologies!),
      skills == null ? null : Object.hashAll(skills!),
    ]);
  }
}