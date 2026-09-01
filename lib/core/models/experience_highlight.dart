import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';

@immutable
class ExperienceHighlight {
  final String id;
  final String? title;
  final String? description;
  final String? icon;
  final String? metric;
  final int? order;
  final Map<String, dynamic>? metadata;

  const ExperienceHighlight({
    required this.id,
    this.title,
    this.description,
    this.icon,
    this.metric,
    this.order,
    this.metadata,
  });

  ExperienceHighlight copyWith({
    String? id,
    String? title,
    String? description,
    String? icon,
    String? metric,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return ExperienceHighlight(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      metric: metric ?? this.metric,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (metric != null) 'metric': metric,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory ExperienceHighlight.fromMap(Map<String, dynamic> map) {
    return ExperienceHighlight(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString(),
      description: map['description']?.toString(),
      icon: map['icon']?.toString(),
      metric: map['metric']?.toString(),
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperienceHighlight.fromJson(Map<String, dynamic> json) =>
      ExperienceHighlight.fromMap(json);

  factory ExperienceHighlight.fromJsonString(String source) =>
      ExperienceHighlight.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExperienceHighlight(id: $id, title: $title, description: $description, metric: $metric, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExperienceHighlight &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.icon == icon &&
        other.metric == metric &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      description,
      icon,
      metric,
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    );
  }
}