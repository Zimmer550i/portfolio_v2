import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'helpers/model_parsing_helpers.dart';
import 'media.dart';

@immutable
class Resume {
  final String id;
  final String title;

  final Media? file;
  final String? fileUrl;
  final String? fileFormat;
  final int? fileSizeBytes;

  final String? description;
  final String? language;
  final String? version;

  final bool featured;
  final int? downloadCount;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? metadata;

  const Resume({
    required this.id,
    required this.title,
    this.file,
    this.fileUrl,
    this.fileFormat,
    this.fileSizeBytes,
    this.description,
    this.language,
    this.version,
    this.featured = false,
    this.downloadCount,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  String? get primaryUrl => file?.url ?? fileUrl;

  String? get formattedFileSize {
    final bytes = fileSizeBytes ?? file?.size;
    if (bytes == null || bytes <= 0) return null;
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Resume copyWith({
    String? id,
    String? title,
    Media? file,
    String? fileUrl,
    String? fileFormat,
    int? fileSizeBytes,
    String? description,
    String? language,
    String? version,
    bool? featured,
    int? downloadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) {
    return Resume(
      id: id ?? this.id,
      title: title ?? this.title,
      file: file ?? this.file,
      fileUrl: fileUrl ?? this.fileUrl,
      fileFormat: fileFormat ?? this.fileFormat,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      description: description ?? this.description,
      language: language ?? this.language,
      version: version ?? this.version,
      featured: featured ?? this.featured,
      downloadCount: downloadCount ?? this.downloadCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      if (file != null) 'file': file!.toMap(),
      if (fileUrl != null) 'fileUrl': fileUrl,
      if (fileFormat != null) 'fileFormat': fileFormat,
      if (fileSizeBytes != null) 'fileSizeBytes': fileSizeBytes,
      if (description != null) 'description': description,
      if (language != null) 'language': language,
      if (version != null) 'version': version,
      'featured': featured,
      if (downloadCount != null) 'downloadCount': downloadCount,
      if (createdAt != null) 'createdAt': ModelParsingHelpers.dateTimeToJson(createdAt),
      if (updatedAt != null) 'updatedAt': ModelParsingHelpers.dateTimeToJson(updatedAt),
      if (metadata != null) 'metadata': metadata,
    };
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      file: map['file'] is Map
          ? Media.fromMap(Map<String, dynamic>.from(map['file'] as Map))
          : null,
      fileUrl: map['fileUrl']?.toString(),
      fileFormat: map['fileFormat']?.toString(),
      fileSizeBytes: ModelParsingHelpers.parseInt(map['fileSizeBytes']),
      description: map['description']?.toString(),
      language: map['language']?.toString(),
      version: map['version']?.toString(),
      featured: ModelParsingHelpers.parseBool(map['featured']) ?? false,
      downloadCount: ModelParsingHelpers.parseInt(map['downloadCount']),
      createdAt: ModelParsingHelpers.parseDateTime(map['createdAt']),
      updatedAt: ModelParsingHelpers.parseDateTime(map['updatedAt']),
      metadata: ModelParsingHelpers.parseMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Resume.fromJson(Map<String, dynamic> json) => Resume.fromMap(json);

  factory Resume.fromJsonString(String source) =>
      Resume.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Resume(id: $id, title: $title, version: $version, language: $language, featured: $featured)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Resume &&
        other.id == id &&
        other.title == title &&
        other.file == file &&
        other.fileUrl == fileUrl &&
        other.fileFormat == fileFormat &&
        other.fileSizeBytes == fileSizeBytes &&
        other.description == description &&
        other.language == language &&
        other.version == version &&
        other.featured == featured &&
        other.downloadCount == downloadCount &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        mapEquals(other.metadata, metadata);
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      title,
      file,
      fileUrl,
      fileFormat,
      fileSizeBytes,
      description,
      language,
      version,
      featured,
      downloadCount,
      createdAt,
      updatedAt,
      metadata == null ? null : Object.hashAll(metadata!.entries),
    ]);
  }
}