import 'package:flutter/material.dart';

/// A cohesive color palette configuration comprising primary, neutral,
/// semantic, and surface colors for both light and dark modes.
class ColorPalette {
  /// Name of this palette (e.g. "Emerald Green", "Ocean Blue")
  final String name;

  /// Primary brand color swatch with shades from 50 to 900
  final MaterialColor primary;

  /// Neutral grayscale swatch with shades from 50 to 900
  final MaterialColor neutral;

  /// Optional secondary accent swatch with shades from 50 to 900
  final MaterialColor? secondary;

  /// Semantic error color (e.g. Color(0xFFDC2626))
  final Color error;

  /// Semantic warning color (e.g. Color(0xFFF59E0B))
  final Color success;

  /// Semantic warning color (e.g. Color(0xFFF59E0B))
  final Color warning;

  /// Semantic info color (e.g. Color(0xFF3B82F6))
  final Color info;

  /// Light mode scaffold background color
  final Color backgroundLight;

  /// Light mode card/surface color
  final Color surfaceLight;

  /// Dark mode scaffold background color
  final Color backgroundDark;

  /// Dark mode card/surface color
  final Color surfaceDark;

  const ColorPalette({
    required this.name,
    required this.primary,
    required this.neutral,
    this.secondary,
    this.error = const Color(0xFFDC2626),
    this.warning = const Color(0xFFF59E0B),
    this.success = const Color(0xFF10B981),
    this.info = const Color(0xFF3B82F6),
    this.backgroundLight = const Color(0xFFFAF9F6),
    this.surfaceLight = const Color(0xFFFFFFFF),
    this.backgroundDark = const Color(0xFF141414),
    this.surfaceDark = const Color(0xFF1E1E1E),
  });

  /// Derives a standard Flutter [ColorScheme] from this palette for light or dark mode.
  ColorScheme toColorScheme({required bool isDark}) {
    if (isDark) {
      return ColorScheme(
        brightness: Brightness.dark,
        primary: primary.shade300,
        onPrimary: neutral.shade900,
        primaryContainer: primary.shade700,
        onPrimaryContainer: primary.shade50,
        secondary: secondary?.shade300 ?? primary.shade200,
        onSecondary: neutral.shade900,
        secondaryContainer: secondary?.shade700 ?? primary.shade800,
        onSecondaryContainer: secondary?.shade50 ?? primary.shade100,
        surface: surfaceDark,
        onSurface: neutral.shade50,
        error: error,
        onError: Colors.white,
        outline: neutral.shade600,
        outlineVariant: neutral.shade700,
        shadow: Colors.black,
      );
    } else {
      return ColorScheme(
        brightness: Brightness.light,
        primary: primary.shade500,
        onPrimary: Colors.white,
        primaryContainer: primary.shade50,
        onPrimaryContainer: primary.shade900,
        secondary: secondary?.shade500 ?? primary.shade400,
        onSecondary: Colors.white,
        secondaryContainer: secondary?.shade50 ?? primary.shade50,
        onSecondaryContainer: secondary?.shade900 ?? primary.shade900,
        surface: surfaceLight,
        onSurface: neutral.shade800,
        error: error,
        onError: Colors.white,
        outline: neutral.shade200,
        outlineVariant: neutral.shade100,
        shadow: neutral.shade900.withValues(alpha: 0.1),
      );
    }
  }

  /// Creates a copy of this palette with selectively overridden attributes.
  ColorPalette copyWith({
    String? name,
    MaterialColor? primary,
    MaterialColor? neutral,
    MaterialColor? secondary,
    Color? error,
    Color? warning,
    Color? success,
    Color? info,
    Color? backgroundLight,
    Color? surfaceLight,
    Color? backgroundDark,
    Color? surfaceDark,
  }) {
    return ColorPalette(
      name: name ?? this.name,
      primary: primary ?? this.primary,
      neutral: neutral ?? this.neutral,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
      backgroundLight: backgroundLight ?? this.backgroundLight,
      surfaceLight: surfaceLight ?? this.surfaceLight,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      surfaceDark: surfaceDark ?? this.surfaceDark,
    );
  }
}
