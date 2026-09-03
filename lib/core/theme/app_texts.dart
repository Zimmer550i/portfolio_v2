import 'package:flutter/material.dart';
import 'package:portfolio_v2/core/theme/app_colors.dart';

/// AppTexts
/// ---------------------------------------------------------------------------
/// Naming Convention:
/// d = Display text (large headings, hero titles)
/// t = Text (body text, labels, paragraphs)
///
/// Size scale (largest → smallest):
/// 2xl, xl, lg, md, sm, xs
///
/// Weight suffix:
/// r = Regular (FontWeight.w400)
/// m = Medium  (FontWeight.w500)
/// s = SemiBold(FontWeight.w600)
/// b = Bold    (FontWeight.w700)
///
/// Example:
/// dxlb -> Display, Extra Large, Bold
/// tsmr -> Text, Small, Regular
///
/// Improvements:
/// - Full variable font support: Variable weight ('wght' 100-900) & width ('wdth' 62.5-150)
/// - Theme-aware light & dark mode sets ([AppTexts.light], [AppTexts.dark], [AppTexts.of(context)])
/// - Dynamic text generators: [AppTexts.display], [AppTexts.text]
/// - Fluent modifiers: `.withColor()`, `.withWeight()`, `.withWidth()`, `.bold`, `.medium`, etc.
/// ---------------------------------------------------------------------------
class AppTexts {
  static const String fontFamily = 'Georama';

  // ===========================================================================
  // DISPLAY (Headings, Hero Titles)
  // ===========================================================================

  // 2XL – 72 (Line Height: 88)
  static TextStyle d2xlr = _base(72, 88, FontWeight.w400);
  static TextStyle d2xlm = _base(72, 88, FontWeight.w500);
  static TextStyle d2xls = _base(72, 88, FontWeight.w600);
  static TextStyle d2xlb = _base(72, 88, FontWeight.w700);

  // XL – 60 (Line Height: 72)
  static TextStyle dxlr = _base(60, 72, FontWeight.w400);
  static TextStyle dxlm = _base(60, 72, FontWeight.w500);
  static TextStyle dxls = _base(60, 72, FontWeight.w600);
  static TextStyle dxlb = _base(60, 72, FontWeight.w700);

  // LG – 48 (Line Height: 60)
  static TextStyle dlgr = _base(48, 60, FontWeight.w400);
  static TextStyle dlgm = _base(48, 60, FontWeight.w500);
  static TextStyle dlgs = _base(48, 60, FontWeight.w600);
  static TextStyle dlgb = _base(48, 60, FontWeight.w700);

  // MD – 36 (Line Height: 44)
  static TextStyle dmdr = _base(36, 44, FontWeight.w400);
  static TextStyle dmdm = _base(36, 44, FontWeight.w500);
  static TextStyle dmds = _base(36, 44, FontWeight.w600);
  static TextStyle dmdb = _base(36, 44, FontWeight.w700);

  // SM – 30 (Line Height: 36)
  static TextStyle dsmr = _base(30, 36, FontWeight.w400);
  static TextStyle dsmm = _base(30, 36, FontWeight.w500);
  static TextStyle dsms = _base(30, 36, FontWeight.w600);
  static TextStyle dsmb = _base(30, 36, FontWeight.w700);

  // XS – 24 (Line Height: 32)
  static TextStyle dxsr = _base(24, 32, FontWeight.w400);
  static TextStyle dxsm = _base(24, 32, FontWeight.w500);
  static TextStyle dxss = _base(24, 32, FontWeight.w600);
  static TextStyle dxsb = _base(24, 32, FontWeight.w700);

  // ===========================================================================
  // TEXT (Body, Paragraphs, Subtitles, Captions)
  // ===========================================================================

  // XL – 20 (Line Height: 30)
  static TextStyle txlr = _base(20, 30, FontWeight.w400);
  static TextStyle txlm = _base(20, 30, FontWeight.w500);
  static TextStyle txls = _base(20, 30, FontWeight.w600);
  static TextStyle txlb = _base(20, 30, FontWeight.w700);

  // LG – 18 (Line Height: 28)
  static TextStyle tlgr = _base(18, 28, FontWeight.w400);
  static TextStyle tlgm = _base(18, 28, FontWeight.w500);
  static TextStyle tlgs = _base(18, 28, FontWeight.w600);
  static TextStyle tlgb = _base(18, 28, FontWeight.w700);

  // MD – 16 (Line Height: 24)
  static TextStyle tmdr = _base(16, 24, FontWeight.w400);
  static TextStyle tmdm = _base(16, 24, FontWeight.w500);
  static TextStyle tmds = _base(16, 24, FontWeight.w600);
  static TextStyle tmdb = _base(16, 24, FontWeight.w700);

  // SM – 14 (Line Height: 20)
  static TextStyle tsmr = _base(14, 20, FontWeight.w400);
  static TextStyle tsmm = _base(14, 20, FontWeight.w500);
  static TextStyle tsms = _base(14, 20, FontWeight.w600);
  static TextStyle tsmb = _base(14, 20, FontWeight.w700);

  // XS – 12 (Line Height: 18)
  static TextStyle txsr = _base(12, 18, FontWeight.w400);
  static TextStyle txsm = _base(12, 18, FontWeight.w500);
  static TextStyle txss = _base(12, 18, FontWeight.w600);
  static TextStyle txsb = _base(12, 18, FontWeight.w700);

  // ===========================================================================
  // DYNAMIC VARIABLE FONT BUILDERS
  // ===========================================================================

  /// Creates a variable display text style with custom size, weight, width, and color.
  static TextStyle display(
    double fontSize, {
    double? lineHeight,
    FontWeight weight = FontWeight.w400,
    double width = 100.0,
    Color? color,
    double? letterSpacing,
  }) {
    final effectiveLineHeight = lineHeight ?? (fontSize * 1.25);
    return _base(
      fontSize,
      effectiveLineHeight,
      weight,
      width: width,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  /// Creates a variable body text style with custom size, weight, width, and color.
  static TextStyle text(
    double fontSize, {
    double? lineHeight,
    FontWeight weight = FontWeight.w400,
    double width = 100.0,
    Color? color,
    double? letterSpacing,
  }) {
    final effectiveLineHeight = lineHeight ?? (fontSize * 1.5);
    return _base(
      fontSize,
      effectiveLineHeight,
      weight,
      width: width,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  // ===========================================================================
  // LIGHT & DARK THEME SETS
  // ===========================================================================
  static final AppTextThemeSet light = AppTextThemeSet(
    isDark: false,
    textColor: AppColors.black.shade400,
  );

  static final AppTextThemeSet dark = AppTextThemeSet(
    isDark: true,
    textColor: const Color(0xFFF5F5F5),
  );

  /// Returns contextual text styles adapted for the current theme brightness.
  static AppTextThemeSet of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? dark : light;
  }

  // ===========================================================================
  // BASE INTERNAL BUILDER
  // ===========================================================================
  static TextStyle _base(
    double fontSize,
    double lineHeight,
    FontWeight weight, {
    double width = 100.0,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      height: lineHeight / fontSize,
      fontWeight: weight,
      color: color, // null by default allows Flutter to inherit theme text color automatically
      letterSpacing: letterSpacing,
      fontVariations: [
        FontVariation('wdth', width),
        FontVariation('wght', weight.value.toDouble()),
      ],
    );
  }
}

/// A complete, theme-adapted collection of all 44 typography styles.
class AppTextThemeSet {
  final bool isDark;
  final Color textColor;

  AppTextThemeSet({required this.isDark, required this.textColor});

  // Display 2XL
  late final TextStyle d2xlr = _applyColor(AppTexts.d2xlr);
  late final TextStyle d2xlm = _applyColor(AppTexts.d2xlm);
  late final TextStyle d2xls = _applyColor(AppTexts.d2xls);
  late final TextStyle d2xlb = _applyColor(AppTexts.d2xlb);

  // Display XL
  late final TextStyle dxlr = _applyColor(AppTexts.dxlr);
  late final TextStyle dxlm = _applyColor(AppTexts.dxlm);
  late final TextStyle dxls = _applyColor(AppTexts.dxls);
  late final TextStyle dxlb = _applyColor(AppTexts.dxlb);

  // Display LG
  late final TextStyle dlgr = _applyColor(AppTexts.dlgr);
  late final TextStyle dlgm = _applyColor(AppTexts.dlgm);
  late final TextStyle dlgs = _applyColor(AppTexts.dlgs);
  late final TextStyle dlgb = _applyColor(AppTexts.dlgb);

  // Display MD
  late final TextStyle dmdr = _applyColor(AppTexts.dmdr);
  late final TextStyle dmdm = _applyColor(AppTexts.dmdm);
  late final TextStyle dmds = _applyColor(AppTexts.dmds);
  late final TextStyle dmdb = _applyColor(AppTexts.dmdb);

  // Display SM
  late final TextStyle dsmr = _applyColor(AppTexts.dsmr);
  late final TextStyle dsmm = _applyColor(AppTexts.dsmm);
  late final TextStyle dsms = _applyColor(AppTexts.dsms);
  late final TextStyle dsmb = _applyColor(AppTexts.dsmb);

  // Display XS
  late final TextStyle dxsr = _applyColor(AppTexts.dxsr);
  late final TextStyle dxsm = _applyColor(AppTexts.dxsm);
  late final TextStyle dxss = _applyColor(AppTexts.dxss);
  late final TextStyle dxsb = _applyColor(AppTexts.dxsb);

  // Text XL
  late final TextStyle txlr = _applyColor(AppTexts.txlr);
  late final TextStyle txlm = _applyColor(AppTexts.txlm);
  late final TextStyle txls = _applyColor(AppTexts.txls);
  late final TextStyle txlb = _applyColor(AppTexts.txlb);

  // Text LG
  late final TextStyle tlgr = _applyColor(AppTexts.tlgr);
  late final TextStyle tlgm = _applyColor(AppTexts.tlgm);
  late final TextStyle tlgs = _applyColor(AppTexts.tlgs);
  late final TextStyle tlgb = _applyColor(AppTexts.tlgb);

  // Text MD
  late final TextStyle tmdr = _applyColor(AppTexts.tmdr);
  late final TextStyle tmdm = _applyColor(AppTexts.tmdm);
  late final TextStyle tmds = _applyColor(AppTexts.tmds);
  late final TextStyle tmdb = _applyColor(AppTexts.tmdb);

  // Text SM
  late final TextStyle tsmr = _applyColor(AppTexts.tsmr);
  late final TextStyle tsmm = _applyColor(AppTexts.tsmm);
  late final TextStyle tsms = _applyColor(AppTexts.tsms);
  late final TextStyle tsmb = _applyColor(AppTexts.tsmb);

  // Text XS
  late final TextStyle txsr = _applyColor(AppTexts.txsr);
  late final TextStyle txsm = _applyColor(AppTexts.txsm);
  late final TextStyle txss = _applyColor(AppTexts.txss);
  late final TextStyle txsb = _applyColor(AppTexts.txsb);

  TextStyle _applyColor(TextStyle base) => base.copyWith(color: textColor);

  /// Converts this typography set to Flutter standard [TextTheme].
  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: d2xlb,
      displayMedium: dxlb,
      displaySmall: dlgb,
      headlineLarge: dmds,
      headlineMedium: dsms,
      headlineSmall: dxss,
      titleLarge: txlb,
      titleMedium: tlgs,
      titleSmall: tmds,
      bodyLarge: tmdr,
      bodyMedium: tsmr,
      bodySmall: txsr,
      labelLarge: tsmm,
      labelMedium: txsm,
      labelSmall: txsr,
    );
  }
}

/// Fluent chaining extensions on [TextStyle] for variable typography customization.
extension AppTextStyleExtensions on TextStyle {
  /// Overrides text color
  TextStyle withColor(Color color) => copyWith(color: color);

  /// Adjusts font weight and updates variable 'wght' axis
  TextStyle withWeight(FontWeight weight) {
    return copyWith(
      fontWeight: weight,
      fontVariations: [
        ...?fontVariations?.where((v) => v.axis != 'wght'),
        FontVariation('wght', weight.value.toDouble()),
      ],
    );
  }

  /// Adjusts variable font width ('wdth' axis between 62.5% and 150%)
  TextStyle withWidth(double width) {
    return copyWith(
      fontVariations: [
        ...?fontVariations?.where((v) => v.axis != 'wdth'),
        FontVariation('wdth', width),
      ],
    );
  }

  /// Overrides font size
  TextStyle withSize(double size) => copyWith(fontSize: size);

  /// Overrides line height factor
  TextStyle withHeight(double height) => copyWith(height: height);

  /// Overrides letter spacing
  TextStyle withLetterSpacing(double spacing) => copyWith(letterSpacing: spacing);

  // Quick weight shortcuts
  TextStyle get regular => withWeight(FontWeight.w400);
  TextStyle get medium => withWeight(FontWeight.w500);
  TextStyle get semiBold => withWeight(FontWeight.w600);
  TextStyle get bold => withWeight(FontWeight.w700);

  // Quick color shortcuts
  TextStyle get primaryColor => withColor(AppColors.primary);
  TextStyle get whiteColor => withColor(AppColors.white);
  TextStyle get mutedColor => withColor(AppColors.neutral.shade300);

  /// Explicitly resolves the text color according to the ambient theme (light/dark)
  TextStyle of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return withColor(isDark ? AppColors.neutral.shade50 : AppColors.neutral.shade800);
  }
}
