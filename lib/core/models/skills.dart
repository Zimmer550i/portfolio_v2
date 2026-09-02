import 'package:portfolio_v2/core/models/technology.dart';

class Skills {
  final Technology technology;
  final DateTime? learningSince;
  final List<Technology>? subTech;
  final String? description;
  const Skills({
    required this.technology,
    this.learningSince,
    this.subTech,
    this.description,
  });
  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      technology: Technology.fromJson(
        json['technology'] as Map<String, dynamic>,
      ),
      learningSince: json['learningSince'] != null
          ? DateTime.parse(json['learningSince'] as String)
          : null,
      subTech: (json['subTech'] as List?)
          ?.map((e) => Technology.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );
  }
  Map<String, dynamic> toJson() => {
    'technology': technology.toJson(),
    'learningSince': learningSince?.toIso8601String(),
    'subTech': subTech?.map((e) => e.toJson()).toList(),
    'description': description,
  };
  Skills copyWith({
    Technology? technology,
    DateTime? learningSince,
    List<Technology>? subTech,
    String? description,
  }) {
    return Skills(
      technology: technology ?? this.technology,
      learningSince: learningSince ?? this.learningSince,
      subTech: subTech ?? this.subTech,
      description: description ?? this.description,
    );
  }
}
