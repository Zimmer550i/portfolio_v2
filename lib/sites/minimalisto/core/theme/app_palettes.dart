import 'package:flutter/material.dart';
import 'package:portfolio_v2/sites/minimalisto/core/theme/color_palette.dart';

/// Predefined color palettes available out of the box.
///
/// Users can easily switch active palettes or add their own custom palettes.
class AppPalettes {

  // Alternative Slate Neutral (cool-tinted gray)
  static const MaterialColor slate = MaterialColor(0xFF64748B, {
    50: Color(0xFFF1F5F9),
    100: Color(0xFFE2E8F0),
    200: Color(0xFFCBD5E1),
    300: Color(0xFF94A3B8),
    400: Color(0xFF64748B),
    500: Color(0xFF475569),
    600: Color(0xFF334155),
    700: Color(0xFF1E293B),
    800: Color(0xFF0F172A),
    900: Color(0xFF020617),
  });

  // ===========================================================================
  // 1. Ocean Blue
  // ===========================================================================
  static const MaterialColor blue = MaterialColor(0xFF0284C7, {
    50: Color(0xFFE0F2FE),
    100: Color(0xFFBAE6FD),
    200: Color(0xFF7DD3FC),
    300: Color(0xFF38BDF8),
    400: Color(0xFF0EA5E9),
    500: Color(0xFF0284C7),
    600: Color(0xFF0369A1),
    700: Color(0xFF075985),
    800: Color(0xFF0C4A6E),
    900: Color(0xFF082F49),
  });

  static const ColorPalette oceanBlue = ColorPalette(
    name: 'Ocean Blue',
    primary: blue,
    neutral: slate,
    backgroundLight: Color(0xFFF8FAFC),
    surfaceLight: Color(0xFFFFFFFF),
    backgroundDark: Color(0xFF0F172A),
    surfaceDark: Color(0xFF1E293B),
  );

  // ===========================================================================
  // List of all pre-built palettes for easy picker UI / switching
  // ===========================================================================
  static const List<ColorPalette> all = [
    oceanBlue,
  ];

  /// Finds a palette by name (case-insensitive), defaulting to [emerald].
  static ColorPalette fromName(String name) {
    return all.firstWhere(
      (p) => p.name.toLowerCase() == name.trim().toLowerCase(),
      orElse: () => oceanBlue,
    );
  }
}
