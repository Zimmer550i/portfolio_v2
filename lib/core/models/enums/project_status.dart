enum ProjectStatus {
  completed,
  ongoing,
  inProgress,
  archived,
  paused,
  planned,
  maintenance,
  deprecated;

  String get displayName {
    switch (this) {
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.ongoing:
        return 'Ongoing';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.archived:
        return 'Archived';
      case ProjectStatus.paused:
        return 'Paused';
      case ProjectStatus.planned:
        return 'Planned';
      case ProjectStatus.maintenance:
        return 'Maintenance';
      case ProjectStatus.deprecated:
        return 'Deprecated';
    }
  }

  bool get isActive =>
      this == ProjectStatus.ongoing ||
      this == ProjectStatus.inProgress ||
      this == ProjectStatus.maintenance;

  static ProjectStatus fromString(String? value) {
    if (value == null || value.isEmpty) return ProjectStatus.completed;
    final normalized = value.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
    for (final status in ProjectStatus.values) {
      if (status.name.toLowerCase() == normalized ||
          status.displayName.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '') == normalized) {
        return status;
      }
    }
    return ProjectStatus.completed;
  }

  String toJson() => name;
}