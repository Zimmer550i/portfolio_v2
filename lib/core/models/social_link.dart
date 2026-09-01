import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class SocialLink {
  final String id;
  final String platform;
  final String url;

  final String? label;
  final String? username;
  final String? icon;
  final Media? iconMedia;
  final bool isPrimary;

  final int? order;
  final Map<String, dynamic>? metadata;

  const SocialLink({
    required this.id,
    required this.platform,
    required this.url,
    this.label,
    this.username,
    this.icon,
    this.iconMedia,
    this.isPrimary = false,
    this.order,
    this.metadata,
  });

  /// Display text prioritizing custom label, then username, then platform.
  String get displayText => label ?? (username != null ? '@$username' : platform);

  SocialLink copyWith({
    String? id,
    String? platform,
    String? url,
    String? label,
    String? username,
    String? icon,
    Media? iconMedia,
    bool? isPrimary,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return SocialLink(
      id: id ?? this.id,
      platform: platform ?? this.platform,
      url: url ?? this.url,
      label: label ?? this.label,
      username: username ?? this.username,
      icon: icon ?? this.icon,
      iconMedia: iconMedia ?? this.iconMedia,
      isPrimary: isPrimary ?? this.isPrimary,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'platform': platform,
      'url': url,
      if (label != null) 'label': label,
      if (username != null) 'username': username,
      if (icon != null) 'icon': icon,
      if (iconMedia != null) 'iconMedia': iconMedia!.toMap(),
      'isPrimary': isPrimary,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory SocialLink.fromMap(Map<String, dynamic> map) {
    return SocialLink(
      id: map['id']?.toString() ?? '',
      platform: map['platform']?.toString() ?? '',
      url: map['url']?.toString() ?? '',
      label: map['label']?.toString(),
      username: map['username']?.toString(),
      icon: map['icon']?.toString(),
      iconMedia: map['iconMedia'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['iconMedia'] as Map))
          : null,
      isPrimary: ModelParsingHelpers.parseBool(map['isPrimary']) ?? false,
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink.fromMap(json);

  factory SocialLink.fromJsonString(String source) =>
      SocialLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialLink(id: $id, platform: $platform, url: $url, label: $label, username: $username, isPrimary: $isPrimary, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SocialLink &&
        other.id == id &&
        other.platform == platform &&
        other.url == url &&
        other.label == label &&
        other.username == username &&
        other.icon == icon &&
        other.iconMedia == iconMedia &&
        other.isPrimary == isPrimary &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      platform,
      url,
      label,
      username,
      icon,
      iconMedia,
      isPrimary,
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    );
  }
}