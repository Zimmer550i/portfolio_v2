/// Helper utilities for resilient, forward-compatible parsing of model fields.
abstract final class ModelParsingHelpers {
  /// Safely parse [DateTime] from ISO string, millisecond/second int, or objects with `toDate()` (e.g. Firestore Timestamp).
  static DateTime? parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) {
      if (value.trim().isEmpty) return null;
      return DateTime.tryParse(value);
    }
    if (value is num) {
      final intVal = value.toInt();
      // Heuristic: values below 10,000,000,000 are in seconds, above are in milliseconds.
      if (intVal < 10000000000) {
        return DateTime.fromMillisecondsSinceEpoch(intVal * 1000);
      }
      return DateTime.fromMillisecondsSinceEpoch(intVal);
    }
    try {
      // Handles Firebase/Firestore Timestamp or custom objects with a toDate() method.
      final dynamic dynamicValue = value;
      if (dynamicValue.toDate != null) {
        final dynamic result = dynamicValue.toDate();
        if (result is DateTime) return result;
      }
    } catch (_) {}
    return null;
  }

  /// Converts [DateTime] to an ISO 8601 string.
  static String? dateTimeToJson(DateTime? value) => value?.toIso8601String();

  /// Safely parse an integer from `num`, `int`, or `String`.
  static int? parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) return null;
      return int.tryParse(trimmed) ?? double.tryParse(trimmed)?.toInt();
    }
    return null;
  }

  /// Safely parse a double from `num`, `double`, or `String`.
  static double? parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is num) return value.toDouble();
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) return null;
      return double.tryParse(trimmed);
    }
    return null;
  }

  /// Safely parse a boolean from `bool` or `String`.
  static bool? parseBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is String) {
      final lower = value.trim().toLowerCase();
      if (lower == 'true' || lower == '1' || lower == 'yes') return true;
      if (lower == 'false' || lower == '0' || lower == 'no') return false;
    }
    if (value is num) {
      return value != 0;
    }
    return null;
  }

  /// Safely parse a `List<String>`.
  static List<String>? parseStringList(dynamic value) {
    if (value == null) return null;
    if (value is List) {
      return value.map((e) => e?.toString() ?? '').where((s) => s.isNotEmpty).toList();
    }
    if (value is String) {
      if (value.trim().isEmpty) return [];
      return [value];
    }
    return null;
  }

  /// Safely parse a `Map<String, dynamic>`.
  static Map<String, dynamic>? parseMap(dynamic value) {
    if (value == null) return null;
    if (value is Map) {
      return Map<String, dynamic>.from(
        value.map((k, v) => MapEntry(k.toString(), v)),
      );
    }
    return null;
  }

  /// Safely parse a list of objects using the provided factory function.
  static List<T>? parseObjectList<T>(
    dynamic value,
    T Function(Map<String, dynamic> map) fromMap,
  ) {
    if (value == null) return null;
    if (value is List) {
      final results = <T>[];
      for (final item in value) {
        if (item is Map) {
          results.add(fromMap(Map<String, dynamic>.from(item)));
        }
      }
      return results;
    }
    return null;
  }
}
