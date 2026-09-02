import 'package:portfolio_v2/core/models/media.dart';

class Achievements {
  final String? title;
  final String? description;
  final DateTime? date;
  final List<Media>? media;
  const Achievements({this.title, this.description, this.date, this.media});
  factory Achievements.fromJson(Map<String, dynamic> json) {
    return Achievements(
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : null,
      media: (json['media'] as List?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'date': date?.toIso8601String(),
    'media': media?.map((e) => e.toJson()).toList(),
  };
  Achievements copyWith({
    String? title,
    String? description,
    DateTime? date,
    List<Media>? media,
  }) {
    return Achievements(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      media: media ?? this.media,
    );
  }
}
