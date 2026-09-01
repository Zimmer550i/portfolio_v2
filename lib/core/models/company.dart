import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class Company {
  final String id;
  final String name;

  final String? slug;
  final Media? logo;
  final String? logoUrl;

  final String? website;
  final String? description;
  final String? industry;
  final String? location;
  final String? city;
  final String? country;
  final int? foundedYear;
  final String? size;

  final String? linkedinUrl;
  final String? githubUrl;
  final String? twitterUrl;
  final String? instagramUrl;

  final String? notes;
  final Map<String, dynamic>? metadata;

  const Company({
    required this.id,
    required this.name,
    this.slug,
    this.logo,
    this.logoUrl,
    this.website,
    this.description,
    this.industry,
    this.location,
    this.city,
    this.country,
    this.foundedYear,
    this.size,
    this.linkedinUrl,
    this.githubUrl,
    this.twitterUrl,
    this.instagramUrl,
    this.notes,
    this.metadata,
  });

  String? get primaryLogoUrl => logo?.url ?? logoUrl;

  Company copyWith({
    String? id,
    String? name,
    String? slug,
    Media? logo,
    String? logoUrl,
    String? website,
    String? description,
    String? industry,
    String? location,
    String? city,
    String? country,
    int? foundedYear,
    String? size,
    String? linkedinUrl,
    String? githubUrl,
    String? twitterUrl,
    String? instagramUrl,
    String? notes,
    Map<String, dynamic>? metadata,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      logo: logo ?? this.logo,
      logoUrl: logoUrl ?? this.logoUrl,
      website: website ?? this.website,
      description: description ?? this.description,
      industry: industry ?? this.industry,
      location: location ?? this.location,
      city: city ?? this.city,
      country: country ?? this.country,
      foundedYear: foundedYear ?? this.foundedYear,
      size: size ?? this.size,
      linkedinUrl: linkedinUrl ?? this.linkedinUrl,
      githubUrl: githubUrl ?? this.githubUrl,
      twitterUrl: twitterUrl ?? this.twitterUrl,
      instagramUrl: instagramUrl ?? this.instagramUrl,
      notes: notes ?? this.notes,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      if (slug != null) 'slug': slug,
      if (logo != null) 'logo': logo!.toMap(),
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (website != null) 'website': website,
      if (description != null) 'description': description,
      if (industry != null) 'industry': industry,
      if (location != null) 'location': location,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (foundedYear != null) 'foundedYear': foundedYear,
      if (size != null) 'size': size,
      if (linkedinUrl != null) 'linkedinUrl': linkedinUrl,
      if (githubUrl != null) 'githubUrl': githubUrl,
      if (twitterUrl != null) 'twitterUrl': twitterUrl,
      if (instagramUrl != null) 'instagramUrl': instagramUrl,
      if (notes != null) 'notes': notes,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      slug: map['slug']?.toString(),
      logo: map['logo'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['logo'] as Map))
          : null,
      logoUrl: map['logoUrl']?.toString(),
      website: map['website']?.toString(),
      description: map['description']?.toString(),
      industry: map['industry']?.toString(),
      location: map['location']?.toString(),
      city: map['city']?.toString(),
      country: map['country']?.toString(),
      foundedYear: ModelParsingHelpers.parseInt(map['foundedYear']),
      size: map['size']?.toString(),
      linkedinUrl: map['linkedinUrl']?.toString(),
      githubUrl: map['githubUrl']?.toString(),
      twitterUrl: map['twitterUrl']?.toString(),
      instagramUrl: map['instagramUrl']?.toString(),
      notes: map['notes']?.toString(),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(Map<String, dynamic> json) => Company.fromMap(json);

  factory Company.fromJsonString(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(id: $id, name: $name, industry: $industry, location: $location, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Company &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.logo == logo &&
        other.logoUrl == logoUrl &&
        other.website == website &&
        other.description == description &&
        other.industry == industry &&
        other.location == location &&
        other.city == city &&
        other.country == country &&
        other.foundedYear == foundedYear &&
        other.size == size &&
        other.linkedinUrl == linkedinUrl &&
        other.githubUrl == githubUrl &&
        other.twitterUrl == twitterUrl &&
        other.instagramUrl == instagramUrl &&
        other.notes == notes &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      name,
      slug,
      logo,
      logoUrl,
      website,
      description,
      industry,
      location,
      city,
      country,
      foundedYear,
      size,
      linkedinUrl,
      githubUrl,
      twitterUrl,
      instagramUrl,
      notes,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    ]);
  }
}