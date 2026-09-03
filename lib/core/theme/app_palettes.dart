import 'package:flutter/material.dart';
import 'package:portfolio_v2/core/theme/color_palette.dart';
import 'package:portfolio_v2/core/theme/palette_color.dart';

/// Predefined color palettes available out of the box.
///
/// Users can easily switch active palettes or add their own custom palettes.
class AppPalettes {
  // ===========================================================================
  // Shared Neutral Grayscale Swatch (Black/Gray)
  // ===========================================================================
  static const PaletteColor black = PaletteColor(0xFF545454, {
    25: Color(0xFFFAFAFA),
    50: Color(0xFFF5F5F5),
    100: Color(0xFFE6E6E6),
    200: Color(0xFFB8B8B8),
    300: Color(0xFF545454),
    400: Color(0xFF333333),
    500: Color(0xFF2E2E2E),
    600: Color(0xFF292929),
    700: Color(0xFF242424),
    800: Color(0xFF1F1F1F),
    900: Color(0xFF1A1A1A),
  });

  // Alternative Slate Neutral (cool-tinted gray)
  static const PaletteColor slate = PaletteColor(0xFF64748B, {
    25: Color(0xFFF8FAFC),
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
  // 1. Emerald Green (Default / Portfolio Brand)
  // ===========================================================================
  static const PaletteColor green = PaletteColor(0xFF005B36, {
    25: Color(0xFFF3F8F6),
    50: Color(0xFFE6EFEB),
    100: Color(0xFFC4D8D0),
    200: Color(0xFF8EB9A6),
    300: Color(0xFF549178),
    400: Color(0xFF2A7657),
    500: Color(0xFF005B36),
    600: Color(0xFF004D2E),
    700: Color(0xFF004126),
    800: Color(0xFF00311D),
    900: Color(0xFF002315),
  });

  static const ColorPalette emerald = ColorPalette(
    name: 'Emerald Green',
    primary: green,
    neutral: black,
    backgroundLight: Color(0xFFFAF9F6),
    surfaceLight: Color(0xFFFFFFFF),
    backgroundDark: Color(0xFF141414),
    surfaceDark: Color(0xFF1E1E1E),
  );

  // ===========================================================================
  // 2. Ocean Blue
  // ===========================================================================
  static const PaletteColor blue = PaletteColor(0xFF0284C7, {
    25: Color(0xFFF0F9FF),
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
  // 3. Royal Violet
  // ===========================================================================
  static const PaletteColor violet = PaletteColor(0xFF7C3AED, {
    25: Color(0xFFFAF5FF),
    50: Color(0xFFF3E8FF),
    100: Color(0xFFE9D5FF),
    200: Color(0xFFD8B4FE),
    300: Color(0xFFC084FC),
    400: Color(0xFFA855F7),
    500: Color(0xFF9333EA),
    600: Color(0xFF7E22CE),
    700: Color(0xFF6B21A8),
    800: Color(0xFF581C87),
    900: Color(0xFF3B0764),
  });

  static const ColorPalette royalViolet = ColorPalette(
    name: 'Royal Violet',
    primary: violet,
    neutral: black,
    backgroundLight: Color(0xFFFAFAFC),
    surfaceLight: Color(0xFFFFFFFF),
    backgroundDark: Color(0xFF13111C),
    surfaceDark: Color(0xFF1E1A2B),
  );

  // ===========================================================================
  // 4. Sunset Amber
  // ===========================================================================
  static const PaletteColor amber = PaletteColor(0xFFD97706, {
    25: Color(0xFFFFFBEB),
    50: Color(0xFFFEF3C7),
    100: Color(0xFFFDE68A),
    200: Color(0xFFFCD34D),
    300: Color(0xFFFBBF24),
    400: Color(0xFFF59E0B),
    500: Color(0xFFD97706),
    600: Color(0xFFB45309),
    700: Color(0xFF92400E),
    800: Color(0xFF78350F),
    900: Color(0xFF451A03),
  });

  static const ColorPalette sunsetAmber = ColorPalette(
    name: 'Sunset Amber',
    primary: amber,
    neutral: black,
    backgroundLight: Color(0xFFFFFDF9),
    surfaceLight: Color(0xFFFFFFFF),
    backgroundDark: Color(0xFF171410),
    surfaceDark: Color(0xFF241F1A),
  );

  // ===========================================================================
  // 5. Slate Monochrome
  // ===========================================================================
  static const PaletteColor monochrome = PaletteColor(0xFF334155, {
    25: Color(0xFFF8FAFC),
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

  static const ColorPalette slateMonochrome = ColorPalette(
    name: 'Slate Monochrome',
    primary: monochrome,
    neutral: slate,
    backgroundLight: Color(0xFFF8FAFC),
    surfaceLight: Color(0xFFFFFFFF),
    backgroundDark: Color(0xFF0B0F19),
    surfaceDark: Color(0xFF131B2E),
  );

  // ===========================================================================
  // 6. Crimson Red
  // ===========================================================================
  static const PaletteColor crimson = PaletteColor(0xFFDC2626, {
    25: Color(0xFFFEF2F2),
    50: Color(0xFFFEE2E2),
    100: Color(0xFFFECACA),
    200: Color(0xFFFCA5A5),
    300: Color(0xFFF87171),
    400: Color(0xFFEF4444),
    500: Color(0xFFDC2626),
    600: Color(0xFFB91C1C),
    700: Color(0xFF991B1B),
    800: Color(0xFF7F1D1D),
    900: Color(0xFF450A0A),
  });

  static const ColorPalette crimsonRed = ColorPalette(
    name: 'Crimson Red',
    primary: crimson,
    neutral: black,
    backgroundLight: Color(0xFFFFF9F9),
    surfaceLight: Color(0xFFFFFFFF),
    backgroundDark: Color(0xFF181111),
    surfaceDark: Color(0xFF261919),
  );

  // ===========================================================================
  // List of all pre-built palettes for easy picker UI / switching
  // ===========================================================================
  static const List<ColorPalette> all = [
    emerald,
    oceanBlue,
    royalViolet,
    sunsetAmber,
    slateMonochrome,
    crimsonRed,
  ];

  /// Finds a palette by name (case-insensitive), defaulting to [emerald].
  static ColorPalette fromName(String name) {
    return all.firstWhere(
      (p) => p.name.toLowerCase() == name.trim().toLowerCase(),
      orElse: () => emerald,
    );
  }
}
