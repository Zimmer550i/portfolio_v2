import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class Testimonial {
  final String id;

  final String personName;
  final String content;

  final String? personTitle;
  final String? company;
  final String? relationship;

  final Media? companyLogo;
  final String? companyLogoUrl;

  final Media? photo;
  final String? photoUrl;

  final String? url;
  final String? linkedinUrl;
  final double? rating;
  final DateTime? date;

  final bool featured;
  final int? order;
  final Map<String, dynamic>? metadata;

  const Testimonial({
    required this.id,
    required this.personName,
    required this.content,
    this.personTitle,
    this.company,
    this.relationship,
    this.companyLogo,
    this.companyLogoUrl,
    this.photo,
    this.photoUrl,
    this.url,
    this.linkedinUrl,
    this.rating,
    this.date,
    this.featured = false,
    this.order,
    this.metadata,
  });

  String? get primaryPhotoUrl => photo?.url ?? photoUrl;
  String? get primaryCompanyLogoUrl => companyLogo?.url ?? companyLogoUrl;

  Testimonial copyWith({
    String? id,
    String? personName,
    String? content,
    String? personTitle,
    String? company,
    String? relationship,
    Media? companyLogo,
    String? companyLogoUrl,
    Media? photo,
    String? photoUrl,
    String? url,
    String? linkedinUrl,
    double? rating,
    DateTime? date,
    bool? featured,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Testimonial(
      id: id ?? this.id,
      personName: personName ?? this.personName,
      content: content ?? this.content,
      personTitle: personTitle ?? this.personTitle,
      company: company ?? this.company,
      relationship: relationship ?? this.relationship,
      companyLogo: companyLogo ?? this.companyLogo,
      companyLogoUrl: companyLogoUrl ?? this.companyLogoUrl,
      photo: photo ?? this.photo,
      photoUrl: photoUrl ?? this.photoUrl,
      url: url ?? this.url,
      linkedinUrl: linkedinUrl ?? this.linkedinUrl,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      featured: featured ?? this.featured,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'personName': personName,
      'content': content,
      if (personTitle != null) 'personTitle': personTitle,
      if (company != null) 'company': company,
      if (relationship != null) 'relationship': relationship,
      if (companyLogo != null) 'companyLogo': companyLogo!.toMap(),
      if (companyLogoUrl != null) 'companyLogoUrl': companyLogoUrl,
      if (photo != null) 'photo': photo!.toMap(),
      if (photoUrl != null) 'photoUrl': photoUrl,
      if (url != null) 'url': url,
      if (linkedinUrl != null) 'linkedinUrl': linkedinUrl,
      if (rating != null) 'rating': rating,
      if (date != null) 'date': ModelParsingHelpers.dateTimeToJson(date),
      'featured': featured,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Testimonial.fromMap(Map<String, dynamic> map) {
    return Testimonial(
      id: map['id']?.toString() ?? '',
      personName: map['personName']?.toString() ?? '',
      content: map['content']?.toString() ?? '',
      personTitle: map['personTitle']?.toString(),
      company: map['company']?.toString(),
      relationship: map['relationship']?.toString(),
      companyLogo: map['companyLogo'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['companyLogo'] as Map))
          : null,
      companyLogoUrl: map['companyLogoUrl']?.toString(),
      photo: map['photo'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['photo'] as Map))
          : null,
      photoUrl: map['photoUrl']?.toString(),
      url: map['url']?.toString(),
      linkedinUrl: map['linkedinUrl']?.toString(),
      rating: ModelParsingHelpers.parseDouble(map['rating']),
      date: ModelParsingHelpers.parseDateTime(map['date']),
      featured: ModelParsingHelpers.parseBool(map['featured']) ?? false,
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Testimonial.fromJson(Map<String, dynamic> json) =>
      Testimonial.fromMap(json);

  factory Testimonial.fromJsonString(String source) =>
      Testimonial.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Testimonial(id: $id, personName: $personName, company: $company, personTitle: $personTitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Testimonial &&
        other.id == id &&
        other.personName == personName &&
        other.content == content &&
        other.personTitle == personTitle &&
        other.company == company &&
        other.relationship == relationship &&
        other.companyLogo == companyLogo &&
        other.companyLogoUrl == companyLogoUrl &&
        other.photo == photo &&
        other.photoUrl == photoUrl &&
        other.url == url &&
        other.linkedinUrl == linkedinUrl &&
        other.rating == rating &&
        other.date == date &&
        other.featured == featured &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      personName,
      content,
      personTitle,
      company,
      relationship,
      companyLogo,
      companyLogoUrl,
      photo,
      photoUrl,
      url,
      linkedinUrl,
      rating,
      date,
      featured,
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    ]);
  }
}