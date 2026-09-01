import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'enums/media_type.dart';
import 'helpers/model_parsing_helpers.dart';

@immutable
class Media {
  final String id;
  final MediaType type;
  final String url;

  final String? thumbnailUrl;
  final String? blurHash;
  final String? filename;
  final String? mimeType;
  final String? alt;
  final String? title;
  final String? caption;
  final String? description;

  final int? width;
  final int? height;
  final int? size;

  final int? order;

  /// Additional data for special media types (e.g. 3D models, video stream configs, CDN metadata).
  final Map<String, dynamic>? metadata;

  const Media({
    required this.id,
    required this.type,
    required this.url,
    this.thumbnailUrl,
    this.blurHash,
    this.filename,
    this.mimeType,
    this.alt,
    this.title,
    this.caption,
    this.description,
    this.width,
    this.height,
    this.size,
    this.order,
    this.metadata,
  });

  bool get isImage => type.isImage;
  bool get isVideo => type.isVideo;
  bool get isModel3d => type.isModel3d;
  bool get isDocument => type.isDocument;
  bool get isAudio => type.isAudio;

  double? get aspectRatio {
    if (width != null && height != null && height! > 0) {
      return width! / height!;
    }
    return null;
  }

  Media copyWith({
    String? id,
    MediaType? type,
    String? url,
    String? thumbnailUrl,
    String? blurHash,
    String? filename,
    String? mimeType,
    String? alt,
    String? title,
    String? caption,
    String? description,
    int? width,
    int? height,
    int? size,
    int? order,
    Map<String, dynamic>? metadata,
  }) {
    return Media(
      id: id ?? this.id,
      type: type ?? this.type,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      blurHash: blurHash ?? this.blurHash,
      filename: filename ?? this.filename,
      mimeType: mimeType ?? this.mimeType,
      alt: alt ?? this.alt,
      title: title ?? this.title,
      caption: caption ?? this.caption,
      description: description ?? this.description,
      width: width ?? this.width,
      height: height ?? this.height,
      size: size ?? this.size,
      order: order ?? this.order,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.toJson(),
      'url': url,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (blurHash != null) 'blurHash': blurHash,
      if (filename != null) 'filename': filename,
      if (mimeType != null) 'mimeType': mimeType,
      if (alt != null) 'alt': alt,
      if (title != null) 'title': title,
      if (caption != null) 'caption': caption,
      if (description != null) 'description': description,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (size != null) 'size': size,
      if (order != null) 'order': order,
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      id: map['id']?.toString() ?? '',
      type: MediaType.fromString(map['type']?.toString()),
      url: map['url']?.toString() ?? '',
      thumbnailUrl: map['thumbnailUrl']?.toString(),
      blurHash: map['blurHash']?.toString(),
      filename: map['filename']?.toString(),
      mimeType: map['mimeType']?.toString(),
      alt: map['alt']?.toString(),
      title: map['title']?.toString(),
      caption: map['caption']?.toString(),
      description: map['description']?.toString(),
      width: ModelParsingHelpers.parseInt(map['width']),
      height: ModelParsingHelpers.parseInt(map['height']),
      size: ModelParsingHelpers.parseInt(map['size']),
      order: ModelParsingHelpers.parseInt(map['order']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Media.fromJson(Map<String, dynamic> json) => Media.fromMap(json);

  factory Media.fromJsonString(String source) =>
      Media.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Media(id: $id, type: $type, url: $url, title: $title, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Media &&
        other.id == id &&
        other.type == type &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl &&
        other.blurHash == blurHash &&
        other.filename == filename &&
        other.mimeType == mimeType &&
        other.alt == alt &&
        other.title == title &&
        other.caption == caption &&
        other.description == description &&
        other.width == width &&
        other.height == height &&
        other.size == size &&
        other.order == order &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      type,
      url,
      thumbnailUrl,
      blurHash,
      filename,
      mimeType,
      alt,
      title,
      caption,
      description,
      width,
      height,
      size,
      order,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    );
  }
}