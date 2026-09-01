enum SkillLevel {
  beginner,
  intermediate,
  advanced,
  expert,
  master;

  String get displayName {
    switch (this) {
      case SkillLevel.beginner:
        return 'Beginner';
      case SkillLevel.intermediate:
        return 'Intermediate';
      case SkillLevel.advanced:
        return 'Advanced';
      case SkillLevel.expert:
        return 'Expert';
      case SkillLevel.master:
        return 'Master';
    }
  }

  /// Approximate percentage value between 0.0 and 1.0.
  double get percentage {
    switch (this) {
      case SkillLevel.beginner:
        return 0.25;
      case SkillLevel.intermediate:
        return 0.50;
      case SkillLevel.advanced:
        return 0.75;
      case SkillLevel.expert:
        return 0.90;
      case SkillLevel.master:
        return 1.00;
    }
  }

  static SkillLevel fromString(String? value) {
    if (value == null || value.isEmpty) return SkillLevel.intermediate;
    final normalized = value.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
    for (final level in SkillLevel.values) {
      if (level.name.toLowerCase() == normalized ||
          level.displayName.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '') == normalized) {
        return level;
      }
    }
    return SkillLevel.intermediate;
  }

  String toJson() => name;
}
