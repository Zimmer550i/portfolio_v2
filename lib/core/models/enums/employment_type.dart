enum EmploymentType {
  fullTime,
  partTime,
  contract,
  freelance,
  internship,
  volunteer,
  remote,
  hybrid,
  selfEmployed,
  seasonal,
  other;

  String get displayName {
    switch (this) {
      case EmploymentType.fullTime:
        return 'Full-time';
      case EmploymentType.partTime:
        return 'Part-time';
      case EmploymentType.contract:
        return 'Contract';
      case EmploymentType.freelance:
        return 'Freelance';
      case EmploymentType.internship:
        return 'Internship';
      case EmploymentType.volunteer:
        return 'Volunteer';
      case EmploymentType.remote:
        return 'Remote';
      case EmploymentType.hybrid:
        return 'Hybrid';
      case EmploymentType.selfEmployed:
        return 'Self-employed';
      case EmploymentType.seasonal:
        return 'Seasonal';
      case EmploymentType.other:
        return 'Other';
    }
  }

  static EmploymentType fromString(String? value) {
    if (value == null || value.isEmpty) return EmploymentType.other;
    final normalized = value.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
    for (final type in EmploymentType.values) {
      if (type.name.toLowerCase() == normalized ||
          type.displayName.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '') == normalized) {
        return type;
      }
    }
    return EmploymentType.other;
  }

  String toJson() => name;
}