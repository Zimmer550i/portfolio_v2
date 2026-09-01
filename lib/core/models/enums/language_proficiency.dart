enum LanguageProficiency {
  elementary,
  limitedWorking,
  professionalWorking,
  fullProfessional,
  nativeOrBilingual;

  String get displayName {
    switch (this) {
      case LanguageProficiency.elementary:
        return 'Elementary Proficiency';
      case LanguageProficiency.limitedWorking:
        return 'Limited Working Proficiency';
      case LanguageProficiency.professionalWorking:
        return 'Professional Working Proficiency';
      case LanguageProficiency.fullProfessional:
        return 'Full Professional Proficiency';
      case LanguageProficiency.nativeOrBilingual:
        return 'Native / Bilingual Proficiency';
    }
  }

  /// Numeric level rating from 1 to 5.
  int get level {
    switch (this) {
      case LanguageProficiency.elementary:
        return 1;
      case LanguageProficiency.limitedWorking:
        return 2;
      case LanguageProficiency.professionalWorking:
        return 3;
      case LanguageProficiency.fullProfessional:
        return 4;
      case LanguageProficiency.nativeOrBilingual:
        return 5;
    }
  }

  static LanguageProficiency fromString(String? value) {
    if (value == null || value.isEmpty) {
      return LanguageProficiency.professionalWorking;
    }
    final normalized = value.toLowerCase().replaceAll(RegExp(r'[\s\-_/]'), '');
    for (final prof in LanguageProficiency.values) {
      if (prof.name.toLowerCase() == normalized ||
          prof.displayName.toLowerCase().replaceAll(RegExp(r'[\s\-_/]'), '') ==
              normalized) {
        return prof;
      }
    }
    if (normalized.contains('native') || normalized.contains('bilingual')) {
      return LanguageProficiency.nativeOrBilingual;
    }
    if (normalized.contains('fluent') || normalized.contains('full')) {
      return LanguageProficiency.fullProfessional;
    }
    if (normalized.contains('professional') || normalized.contains('working')) {
      return LanguageProficiency.professionalWorking;
    }
    if (normalized.contains('intermediate') || normalized.contains('limited')) {
      return LanguageProficiency.limitedWorking;
    }
    if (normalized.contains('basic') || normalized.contains('elementary') || normalized.contains('beginner')) {
      return LanguageProficiency.elementary;
    }
    return LanguageProficiency.professionalWorking;
  }

  String toJson() => name;
}
