import 'package:flutter/material.dart';
import 'package:portfolio_v2/core/theme/app_colors.dart';
import 'package:portfolio_v2/core/theme/app_palettes.dart';
import 'package:portfolio_v2/core/theme/app_texts.dart';
import 'package:portfolio_v2/core/theme/color_palette.dart';

/// Complete application theme definitions for light and dark modes.
///
/// Supports runtime palette swapping, Material 3 specifications, component themes,
/// and custom [ThemeExtension] access via `context.colors` and `context.texts`.
class AppTheme {
  // ===========================================================================
  // LIGHT THEME
  // ===========================================================================
  static ThemeData light([ColorPalette? palette]) {
    final activePalette = palette ?? AppColors.currentPalette;
    final colorScheme = activePalette.toColorScheme(isDark: false);
    final textTheme = AppTexts.light.toTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      fontFamily: AppTexts.fontFamily,
      scaffoldBackgroundColor: activePalette.backgroundLight,
      canvasColor: activePalette.backgroundLight,
      cardColor: activePalette.surfaceLight,
      dividerColor: activePalette.neutral.shade100,

      // Typography
      textTheme: textTheme,

      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: activePalette.surfaceLight,
        foregroundColor: activePalette.neutral.shade800,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        titleTextStyle: AppTexts.txlb.copyWith(
          color: activePalette.neutral.shade800,
        ),
        iconTheme: IconThemeData(color: activePalette.neutral.shade700),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: activePalette.surfaceLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: activePalette.neutral.shade100),
        ),
        margin: EdgeInsets.zero,
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: activePalette.primary.shade500,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTexts.tsmm.copyWith(color: Colors.white),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: activePalette.neutral.shade800,
          side: BorderSide(color: activePalette.neutral.shade200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTexts.tsmm.copyWith(
            color: activePalette.neutral.shade800,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: activePalette.primary.shade500,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTexts.tsmm.copyWith(
            color: activePalette.primary.shade500,
          ),
        ),
      ),

      // Form Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: activePalette.surfaceLight,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: AppTexts.tsmr.copyWith(
          color: activePalette.neutral.shade300,
        ),
        labelStyle: AppTexts.tsmr.copyWith(
          color: activePalette.neutral.shade600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: activePalette.neutral.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: activePalette.neutral.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: activePalette.primary.shade500,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: activePalette.error),
        ),
      ),

      // Divider & Chips
      dividerTheme: DividerThemeData(
        color: activePalette.neutral.shade100,
        thickness: 1,
        space: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: activePalette.neutral.shade50,
        side: BorderSide(color: activePalette.neutral.shade100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        labelStyle: AppTexts.txsm.copyWith(
          color: activePalette.neutral.shade700,
        ),
      ),

      // Theme Extensions
      extensions: [
        AppColorsExtension.fromPalette(activePalette, isDark: false),
        AppTextsExtension(AppTexts.light),
      ],
    );
  }

  // ===========================================================================
  // DARK THEME
  // ===========================================================================
  static ThemeData dark([ColorPalette? palette]) {
    final activePalette = palette ?? AppColors.currentPalette;
    final colorScheme = activePalette.toColorScheme(isDark: true);
    final textTheme = AppTexts.dark.toTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      fontFamily: AppTexts.fontFamily,
      scaffoldBackgroundColor: activePalette.backgroundDark,
      canvasColor: activePalette.backgroundDark,
      cardColor: activePalette.surfaceDark,
      dividerColor: activePalette.neutral.shade800,

      // Typography
      textTheme: textTheme,

      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: activePalette.surfaceDark,
        foregroundColor: activePalette.neutral.shade50,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        titleTextStyle: AppTexts.dark.txlb,
        iconTheme: IconThemeData(color: activePalette.neutral.shade200),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: activePalette.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: activePalette.neutral.shade800),
        ),
        margin: EdgeInsets.zero,
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: activePalette.primary.shade400,
          foregroundColor: activePalette.neutral.shade900,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTexts.tsmm.copyWith(
            color: activePalette.neutral.shade900,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: activePalette.neutral.shade100,
          side: BorderSide(color: activePalette.neutral.shade700),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTexts.dark.tsmm,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: activePalette.primary.shade300,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTexts.tsmm.copyWith(
            color: activePalette.primary.shade300,
          ),
        ),
      ),

      // Form Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: activePalette.surfaceDark,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: AppTexts.tsmr.copyWith(
          color: activePalette.neutral.shade500,
        ),
        labelStyle: AppTexts.tsmr.copyWith(
          color: activePalette.neutral.shade300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: activePalette.neutral.shade700),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: activePalette.neutral.shade700),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: activePalette.primary.shade400,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: activePalette.error),
        ),
      ),

      // Divider & Chips
      dividerTheme: DividerThemeData(
        color: activePalette.neutral.shade800,
        thickness: 1,
        space: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: activePalette.neutral.shade800,
        side: BorderSide(color: activePalette.neutral.shade700),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        labelStyle: AppTexts.txsm.copyWith(
          color: activePalette.neutral.shade200,
        ),
      ),

      // Theme Extensions
      extensions: [
        AppColorsExtension.fromPalette(activePalette, isDark: true),
        AppTextsExtension(AppTexts.dark),
      ],
    );
  }

  /// Convenience getter for light theme with currently active palette.
  static ThemeData get lightTheme => light();

  /// Convenience getter for dark theme with currently active palette.
  static ThemeData get darkTheme => dark();

  /// Gets the theme matching a specific palette and brightness.
  static ThemeData getTheme(ColorPalette palette, {required bool isDark}) {
    return isDark ? dark(palette) : light(palette);
  }
}

// =============================================================================
// THEME EXTENSIONS
// =============================================================================

/// Allows accessing contextual colors via `Theme.of(context).extension<AppColorsExtension>()`
/// or simply `context.colors`.
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final MaterialColor primary;
  final MaterialColor neutral;
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Color divider;
  final Color error;
  final Color warning;
  final Color success;
  final Color info;

  const AppColorsExtension({
    required this.primary,
    required this.neutral,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.divider,
    required this.error,
    required this.warning,
    required this.success,
    required this.info,
  });

  factory AppColorsExtension.fromPalette(
    ColorPalette palette, {
    required bool isDark,
  }) {
    return AppColorsExtension(
      primary: palette.primary,
      neutral: palette.neutral,
      background: isDark ? palette.backgroundDark : palette.backgroundLight,
      surface: isDark ? palette.surfaceDark : palette.surfaceLight,
      textPrimary: isDark ? palette.neutral.shade50 : palette.neutral.shade800,
      textSecondary: isDark
          ? palette.neutral.shade300
          : palette.neutral.shade400,
      textMuted: isDark ? palette.neutral.shade500 : palette.neutral.shade200,
      border: isDark ? palette.neutral.shade800 : palette.neutral.shade100,
      divider: isDark ? palette.neutral.shade800 : palette.neutral.shade50,
      error: palette.error,
      warning: palette.warning,
      success: palette.success,
      info: palette.info,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    MaterialColor? primary,
    MaterialColor? neutral,
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? border,
    Color? divider,
    Color? error,
    Color? warning,
    Color? success,
    Color? info,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      neutral: neutral ?? this.neutral,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      primary: t < 0.5 ? primary : other.primary,
      neutral: t < 0.5 ? neutral : other.neutral,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      textMuted: Color.lerp(textMuted, other.textMuted, t) ?? textMuted,
      border: Color.lerp(border, other.border, t) ?? border,
      divider: Color.lerp(divider, other.divider, t) ?? divider,
      error: Color.lerp(error, other.error, t) ?? error,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      success: Color.lerp(success, other.success, t) ?? success,
      info: Color.lerp(info, other.info, t) ?? info,
    );
  }
}

/// Allows accessing contextual typography via `Theme.of(context).extension<AppTextsExtension>()`
/// or simply `context.texts`.
class AppTextsExtension extends ThemeExtension<AppTextsExtension> {
  final AppTextThemeSet set;

  const AppTextsExtension(this.set);

  @override
  ThemeExtension<AppTextsExtension> copyWith({AppTextThemeSet? set}) {
    return AppTextsExtension(set ?? this.set);
  }

  @override
  ThemeExtension<AppTextsExtension> lerp(
    covariant ThemeExtension<AppTextsExtension>? other,
    double t,
  ) {
    if (other is! AppTextsExtension) return this;
    return t < 0.5 ? this : other;
  }
}

// =============================================================================
// CONVENIENT BUILDCONTEXT EXTENSIONS
// =============================================================================

/// Quick accessors on [BuildContext] for theme, colors, and typography.
extension AppThemeContextExtensions on BuildContext {
  /// Whether dark mode is currently active
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// Current [ThemeData]
  ThemeData get theme => Theme.of(this);

  /// Current [ColorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Semantic and palette colors for the current theme
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>() ??
      AppColorsExtension.fromPalette(AppPalettes.emerald, isDark: isDark);

  /// Theme-adapted typography set
  AppTextThemeSet get texts =>
      Theme.of(this).extension<AppTextsExtension>()?.set ?? AppTexts.of(this);
}
