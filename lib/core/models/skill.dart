import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'enums/skill_level.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class Skill {
  final String id;
  final String name;

  final String? category;
  final SkillLevel? level;
  final int? proficiency;
  final double? yearsOfExperience;
  final bool featured;

  final String? description;
  final String? icon;
  final Media? iconMedia;
  final String? url;
  final List<String>? tags;

  final int? order;
  final Map<String, dynamic>? metadata;

  const Skill({
    required this.id,
    required this.name,
    this.category,
    this.level,
    this.proficiency,
    this.yearsOfExperience,
    this.featured = false,
    this.description,
    this.icon,
    this.iconMedia,
    this.url,
    this.tags,
    this.order,
    this.metadata,
  });

  /// Percentage (0.0 to 1.0) derived from explicit proficiency (0..100) or enum level.
  double get levelPercentage {
    if (proficiency != null) {
      if (proficiency! <= 5 && proficiency! > 0) {
        return proficiency! / 5.0;
      }
      return (proficiency! / 100.0).clamp(0.0, 1.0);
    }
    if (level != null) {
      return level!.percentage;
    }
    return 0.75;
  }

  Skill copyWith({
    String? id,
    String? name,
    String? category,
    SkillLevel? level,
    int? proficiency,
    double? yearsOfExperience,
    bool? featured,
    String? description,
    String? icon,
    Media? iconMedia,
    String? url,
    List<String>? tags,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Skill(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      level: level ?? this.level,
      proficiency: proficiency ?? this.proficiency,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      featured: featured ?? this.featured,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      iconMedia: iconMedia ?? this.iconMedia,
      url: url ?? this.url,
      tags: tags ?? this.tags,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      if (category != null) 'category': category,
      if (level != null) 'level': level!.toJson(),
      if (proficiency != null) 'proficiency': proficiency,
      if (yearsOfExperience != null) 'yearsOfExperience': yearsOfExperience,
      'featured': featured,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (iconMedia != null) 'iconMedia': iconMedia!.toMap(),
      if (url != null) 'url': url,
      if (tags != null) 'tags': tags,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      category: map['category']?.toString(),
      level: map['level'] != null
          ? SkillLevel.fromString(map['level']?.toString())
          : null,
      proficiency: ModelParsingHelpers.parseInt(map['proficiency']),
      yearsOfExperience: ModelParsingHelpers.parseDouble(map['yearsOfExperience']),
      featured: ModelParsingHelpers.parseBool(map['featured']) ?? false,
      description: map['description']?.toString(),
      icon: map['icon']?.toString(),
      iconMedia: map['iconMedia'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['iconMedia'] as Map))
          : null,
      url: map['url']?.toString(),
      tags: ModelParsingHelpers.parseStringList(map['tags']),
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(Map<String, dynamic> json) => Skill.fromMap(json);

  factory Skill.fromJsonString(String source) =>
      Skill.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Skill(id: $id, name: $name, category: $category, level: $level, featured: $featured)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Skill &&
        other.id == id &&
        other.name == name &&
        other.category == category &&
        other.level == level &&
        other.proficiency == proficiency &&
        other.yearsOfExperience == yearsOfExperience &&
        other.featured == featured &&
        other.description == description &&
        other.icon == icon &&
        other.iconMedia == iconMedia &&
        other.url == url &&
        listEquals(other.tags, tags) &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      name,
      category,
      level,
      proficiency,
      yearsOfExperience,
      featured,
      description,
      icon,
      iconMedia,
      url,
      tags == null ? null : Object.hashAll(tags!),
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    ]);
  }
}