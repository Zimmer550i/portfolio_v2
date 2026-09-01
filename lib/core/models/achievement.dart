import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class Achievement {
  final String id;
  final String title;

  final String? issuer;
  final String? category;
  final DateTime? date;

  final String? description;
  final String? associatedWith;
  final String? url;

  final Media? image;
  final String? imageUrl;

  final int? order;
  final Map<String, dynamic>? metadata;

  const Achievement({
    required this.id,
    required this.title,
    this.issuer,
    this.category,
    this.date,
    this.description,
    this.associatedWith,
    this.url,
    this.image,
    this.imageUrl,
    this.order,
    this.metadata,
  });

  String? get primaryImageUrl => image?.url ?? imageUrl;

  Achievement copyWith({
    String? id,
    String? title,
    String? issuer,
    String? category,
    DateTime? date,
    String? description,
    String? associatedWith,
    String? url,
    Media? image,
    String? imageUrl,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Achievement(
      id: id ?? this.id,
      title: title ?? this.title,
      issuer: issuer ?? this.issuer,
      category: category ?? this.category,
      date: date ?? this.date,
      description: description ?? this.description,
      associatedWith: associatedWith ?? this.associatedWith,
      url: url ?? this.url,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      if (issuer != null) 'issuer': issuer,
      if (category != null) 'category': category,
      if (date != null) 'date': ModelParsingHelpers.dateTimeToJson(date),
      if (description != null) 'description': description,
      if (associatedWith != null) 'associatedWith': associatedWith,
      if (url != null) 'url': url,
      if (image != null) 'image': image!.toMap(),
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      issuer: map['issuer']?.toString(),
      category: map['category']?.toString(),
      date: ModelParsingHelpers.parseDateTime(map['date']),
      description: map['description']?.toString(),
      associatedWith: map['associatedWith']?.toString(),
      url: map['url']?.toString(),
      image: map['image'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['image'] as Map))
          : null,
      imageUrl: map['imageUrl']?.toString(),
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      Achievement.fromMap(json);

  factory Achievement.fromJsonString(String source) =>
      Achievement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Achievement(id: $id, title: $title, issuer: $issuer, category: $category, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Achievement &&
        other.id == id &&
        other.title == title &&
        other.issuer == issuer &&
        other.category == category &&
        other.date == date &&
        other.description == description &&
        other.associatedWith == associatedWith &&
        other.url == url &&
        other.image == image &&
        other.imageUrl == imageUrl &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      issuer,
      category,
      date,
      description,
      associatedWith,
      url,
      image,
      imageUrl,
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    );
  }
}