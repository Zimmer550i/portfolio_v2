enum MediaType {
  image,
  photo,
  video,
  model3d,
  document,
  audio,
  vector,
  animation,
  other;

  String get displayName {
    switch (this) {
      case MediaType.image:
        return 'Image';
      case MediaType.photo:
        return 'Photo';
      case MediaType.video:
        return 'Video';
      case MediaType.model3d:
        return '3D Model';
      case MediaType.document:
        return 'Document';
      case MediaType.audio:
        return 'Audio';
      case MediaType.vector:
        return 'Vector';
      case MediaType.animation:
        return 'Animation';
      case MediaType.other:
        return 'Other';
    }
  }

  bool get isImage => this == MediaType.image || this == MediaType.photo;
  bool get isVideo => this == MediaType.video;
  bool get isModel3d => this == MediaType.model3d;
  bool get isDocument => this == MediaType.document;
  bool get isAudio => this == MediaType.audio;

  static MediaType fromString(String? value) {
    if (value == null || value.isEmpty) return MediaType.other;
    final normalized = value.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
    for (final type in MediaType.values) {
      if (type.name.toLowerCase() == normalized ||
          type.displayName.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '') == normalized) {
        return type;
      }
    }
    if (normalized == '3d' || normalized == '3dmodel') {
      return MediaType.model3d;
    }
    return MediaType.other;
  }

  String toJson() => name;
}