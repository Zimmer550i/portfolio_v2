import 'package:flutter/material.dart';
import 'package:portfolio_v2/core/theme/app_palettes.dart';
import 'package:portfolio_v2/core/theme/color_palette.dart';

/// Central application colors system.
///
/// Features:
/// - Base static constants matching original example ([white], [bg], [red], [green], [black])
/// - Dynamic swappable palettes ([currentPalette], [setPalette])
/// - Semantic design tokens ([primary], [neutral], [error], [warning], [success], [info])
/// - Context-aware theme resolution ([AppColors.of(context)])
class AppColors {
  // ===========================================================================
  // Base Constants (Direct match to lib/example/app_colors.dart)
  // ===========================================================================
  static const Color white = Color(0xFFFFFFFF);
  static const Color bg = Color(0xFFFAF9F6);
  static const Color red = Color(0xFFDC2626);

  /// Default Green Swatch (shades 50..900)
  static const MaterialColor green = AppPalettes.green;

  /// Default Black/Gray Swatch (shades 50..900)
  static const MaterialColor black = AppPalettes.black;

  // ===========================================================================
  // Active Palette State Management
  // ===========================================================================
  static ColorPalette _currentPalette = AppPalettes.emerald;

  /// Gets the currently active [ColorPalette].
  static ColorPalette get currentPalette => _currentPalette;

  /// Sets the active palette, immediately updating theme tokens across the app.
  static void setPalette(ColorPalette palette) {
    _currentPalette = palette;
  }

  // ===========================================================================
  // Dynamic Swatch Getters (Derive from active palette)
  // ===========================================================================
  /// Primary brand swatch from the current palette (e.g. green shades 50..900)
  static MaterialColor get primary => _currentPalette.primary;

  /// Neutral grayscale swatch from the current palette (shades 50..900)
  static MaterialColor get neutral => _currentPalette.neutral;

  /// Optional secondary accent swatch
  static MaterialColor? get secondary => _currentPalette.secondary;

  // ===========================================================================
  // Semantic Colors
  // ===========================================================================
  static Color get error => _currentPalette.error;
  static Color get warning => _currentPalette.warning;
  static Color get success => _currentPalette.success;
  static Color get info => _currentPalette.info;

  // ===========================================================================
  // Context-Aware Colors Resolver
  // ===========================================================================
  /// Returns contextual tokens adapted for the current theme brightness (dark or light).
  static AppColorsOf of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppColorsOf(palette: _currentPalette, isDark: isDark);
  }
}

/// Context-aware color tokens resolved for a specific theme brightness.
class AppColorsOf {
  final ColorPalette palette;
  final bool isDark;

  const AppColorsOf({required this.palette, required this.isDark});

  Color get primary =>
      isDark ? palette.primary.shade300 : palette.primary.shade500;
  Color get primaryContainer =>
      isDark ? palette.primary.shade800 : palette.primary.shade50;
  Color get onPrimary => isDark ? palette.neutral.shade900 : Colors.white;

  Color get background =>
      isDark ? palette.backgroundDark : palette.backgroundLight;
  Color get surface => isDark ? palette.surfaceDark : palette.surfaceLight;

  Color get textPrimary =>
      isDark ? palette.neutral.shade50 : palette.neutral.shade800;
  Color get textSecondary =>
      isDark ? palette.neutral.shade300 : palette.neutral.shade400;
  Color get textMuted =>
      isDark ? palette.neutral.shade500 : palette.neutral.shade200;

  Color get border =>
      isDark ? palette.neutral.shade700 : palette.neutral.shade100;
  Color get divider =>
      isDark ? palette.neutral.shade800 : palette.neutral.shade50;

  Color get error => palette.error;
  Color get warning => palette.warning;
  Color get success => palette.success;
  Color get info => palette.info;

  MaterialColor get primaryPalette => palette.primary;
  MaterialColor get neutralPalette => palette.neutral;
}
