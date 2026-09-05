import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_v2/core/constants/portfolio_data.dart';
import 'package:portfolio_v2/core/models/person.dart';
import 'package:portfolio_v2/sites/minimalisto/core/theme/theme.dart';

/// The first full-viewport hero section of the portfolio home page.
///
/// Showcases the person's name, highlight role, summary, skills, and social
/// links with staggered entrance animations using flutter_animate_on_scroll.
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late final AnimationController _gradientController;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final person = user;
    final colors = AppColors.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;

    return SizedBox(
      height: screenSize.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Animated background gradient orbs
          _AnimatedBackgroundOrbs(
            controller: _gradientController,
            colors: colors,
          ),

          // Main content
          Center(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 80 : (isTablet ? 48 : 24),
                ),
                child: isDesktop
                    ? _DesktopLayout(person: person, colors: colors)
                    : _MobileLayout(
                        person: person,
                        colors: colors,
                        isTablet: isTablet,
                      ),
              ),
            ),
          ),

          // Scroll indicator at the bottom
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: _ScrollDownIndicator(
              pulseController: _pulseController,
              colors: colors,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// DESKTOP LAYOUT (side-by-side)
// =============================================================================
class _DesktopLayout extends StatelessWidget {
  final Person person;
  final AppColorsOf colors;

  const _DesktopLayout({required this.person, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left: Text Content
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _GreetingBadge(colors: colors),
              const SizedBox(height: 24),
              _HeroName(name: person.name, colors: colors),
              const SizedBox(height: 16),
              _HeroHighlight(highlight: person.highlight, colors: colors),
              const SizedBox(height: 28),
              _HeroSummary(summary: person.summery, colors: colors),
              const SizedBox(height: 40),
              _SkillChips(skills: person.skills, colors: colors),
              const SizedBox(height: 40),
              _ActionButtons(person: person, colors: colors),
            ],
          ),
        ),

        const SizedBox(width: 60),

        // Right: Avatar + decorative ring
        Expanded(
          flex: 2,
          child: _HeroAvatar(
            imgAsset: person.imgAsset,
            colors: colors,
            size: 340,
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// MOBILE / TABLET LAYOUT (stacked)
// =============================================================================
class _MobileLayout extends StatelessWidget {
  final Person person;
  final AppColorsOf colors;
  final bool isTablet;

  const _MobileLayout({
    required this.person,
    required this.colors,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 40),
        _HeroAvatar(
          imgAsset: person.imgAsset,
          colors: colors,
          size: isTablet ? 240 : 180,
        ),
        const SizedBox(height: 36),
        _GreetingBadge(colors: colors),
        const SizedBox(height: 20),
        _HeroName(
          name: person.name,
          colors: colors,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        _HeroHighlight(
          highlight: person.highlight,
          colors: colors,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        _HeroSummary(
          summary: person.summery,
          colors: colors,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _SkillChips(skills: person.skills, colors: colors, centered: true),
        const SizedBox(height: 32),
        _ActionButtons(person: person, colors: colors, centered: true),
        const SizedBox(height: 60),
      ],
    );
  }
}

// =============================================================================
// ANIMATED BACKGROUND ORBS
// =============================================================================
class _AnimatedBackgroundOrbs extends StatelessWidget {
  final AnimationController controller;
  final AppColorsOf colors;

  const _AnimatedBackgroundOrbs({
    required this.controller,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final t = controller.value;
        return Stack(
          children: [
            Positioned(
              top: -80 + (t * 40),
              right: -60 + (t * 30),
              child: _GlowOrb(
                size: 400,
                color: colors.primary.withValues(alpha: 0.06),
              ),
            ),
            Positioned(
              bottom: -100 + (t * 50),
              left: -80 + (t * 20),
              child: _GlowOrb(
                size: 350,
                color: colors.primary.withValues(alpha: 0.04),
              ),
            ),
            Positioned(
              top: 200 + (t * 30),
              left: 200 - (t * 15),
              child: _GlowOrb(
                size: 200,
                color: colors.primary.withValues(alpha: 0.03),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowOrb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}

// =============================================================================
// GREETING BADGE
// =============================================================================
class _GreetingBadge extends StatelessWidget {
  final AppColorsOf colors;

  const _GreetingBadge({required this.colors});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      config: BaseAnimationConfig(
        delay: 100.ms,
        duration: 700.ms,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colors.primary.withValues(alpha: 0.15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('👋', style: AppTexts.tmdr),
              const SizedBox(width: 8),
              Text(
                "Hello, I'm",
                style: AppTexts.tsmm.withColor(colors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HERO NAME
// =============================================================================
class _HeroName extends StatelessWidget {
  final String name;
  final AppColorsOf colors;
  final TextAlign textAlign;

  const _HeroName({
    required this.name,
    required this.colors,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width > 900;

    return FadeInLeft(
      config: BaseAnimationConfig(
        delay: 250.ms,
        duration: 800.ms,
        child: Text(
          name,
          textAlign: textAlign,
          style: (isDesktop ? AppTexts.d2xlb : AppTexts.dxlb)
              .withColor(colors.textPrimary),
        ),
      ),
    );
  }
}

// =============================================================================
// HERO HIGHLIGHT (role/title)
// =============================================================================
class _HeroHighlight extends StatelessWidget {
  final String? highlight;
  final AppColorsOf colors;
  final TextAlign textAlign;

  const _HeroHighlight({
    required this.highlight,
    required this.colors,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    if (highlight == null) return const SizedBox.shrink();

    final isDesktop = MediaQuery.sizeOf(context).width > 900;

    return FadeInLeft(
      config: BaseAnimationConfig(
        delay: 400.ms,
        duration: 800.ms,
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              colors.primary,
              colors.primary.withValues(alpha: 0.6),
            ],
          ).createShader(bounds),
          child: Text(
            highlight!,
            textAlign: textAlign,
            style: (isDesktop ? AppTexts.dlgb : AppTexts.dmdb)
                .withColor(Colors.white),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HERO SUMMARY
// =============================================================================
class _HeroSummary extends StatelessWidget {
  final String? summary;
  final AppColorsOf colors;
  final TextAlign textAlign;

  const _HeroSummary({
    required this.summary,
    required this.colors,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    if (summary == null) return const SizedBox.shrink();

    final isDesktop = MediaQuery.sizeOf(context).width > 900;

    return FadeInUp(
      config: BaseAnimationConfig(
        delay: 550.ms,
        duration: 800.ms,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isDesktop ? 560 : double.infinity),
          child: Text(
            summary!,
            textAlign: textAlign,
            style: (isDesktop ? AppTexts.tlgr : AppTexts.tmdr)
                .withColor(colors.textSecondary)
                .withHeight(1.7),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// SKILL CHIPS
// =============================================================================
class _SkillChips extends StatelessWidget {
  final List<dynamic>? skills;
  final AppColorsOf colors;
  final bool centered;

  const _SkillChips({
    required this.skills,
    required this.colors,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    if (skills == null || skills!.isEmpty) return const SizedBox.shrink();

    return FadeInUp(
      config: BaseAnimationConfig(
        delay: 700.ms,
        duration: 800.ms,
        child: Wrap(
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: [
            for (int i = 0; i < skills!.length; i++)
              _AnimatedSkillChip(
                label: skills![i].technology.name,
                index: i,
                colors: colors,
              ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedSkillChip extends StatefulWidget {
  final String label;
  final int index;
  final AppColorsOf colors;

  const _AnimatedSkillChip({
    required this.label,
    required this.index,
    required this.colors,
  });

  @override
  State<_AnimatedSkillChip> createState() => _AnimatedSkillChipState();
}

class _AnimatedSkillChipState extends State<_AnimatedSkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _hovered
              ? widget.colors.primary.withValues(alpha: 0.12)
              : widget.colors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered
                ? widget.colors.primary.withValues(alpha: 0.3)
                : widget.colors.primary.withValues(alpha: 0.1),
          ),
        ),
        child: Text(
          widget.label,
          style: AppTexts.tsmm.withColor(
            _hovered ? widget.colors.primary : widget.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// ACTION BUTTONS (Download CV + Social Links)
// =============================================================================
class _ActionButtons extends StatelessWidget {
  final Person person;
  final AppColorsOf colors;
  final bool centered;

  const _ActionButtons({
    required this.person,
    required this.colors,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      config: BaseAnimationConfig(
        delay: 850.ms,
        duration: 800.ms,
        child: Wrap(
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            // Primary CTA
            _PrimaryCTAButton(colors: colors),

            // Social links
            if (person.social != null) ...[
              Container(
                width: 1,
                height: 28,
                color: colors.border,
              ),
              for (final link in person.social!)
                _SocialIconButton(
                  name: link.name ?? '',
                  url: link.url,
                  colors: colors,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PrimaryCTAButton extends StatefulWidget {
  final AppColorsOf colors;

  const _PrimaryCTAButton({required this.colors});

  @override
  State<_PrimaryCTAButton> createState() => _PrimaryCTAButtonState();
}

class _PrimaryCTAButtonState extends State<_PrimaryCTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: _hovered
            ? (Matrix4.identity()..setTranslationRaw(0, -2, 0))
            : Matrix4.identity(),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download_rounded, size: 18),
          label: const Text('Download CV'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            backgroundColor: widget.colors.primary,
            foregroundColor: Colors.white,
            elevation: _hovered ? 8 : 0,
            shadowColor: widget.colors.primary.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final String name;
  final String url;
  final AppColorsOf colors;

  const _SocialIconButton({
    required this.name,
    required this.url,
    required this.colors,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _hovered = false;

  IconData _iconForName(String name) {
    switch (name.toLowerCase()) {
      case 'github':
        return Icons.code_rounded;
      case 'linkedin':
        return Icons.work_outline_rounded;
      case 'twitter':
        return Icons.alternate_email_rounded;
      default:
        return Icons.link_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Tooltip(
        message: widget.name,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.colors.primary.withValues(alpha: 0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? widget.colors.primary.withValues(alpha: 0.2)
                  : widget.colors.border.withValues(alpha: 0.5),
            ),
          ),
          child: Icon(
            _iconForName(widget.name),
            size: 20,
            color: _hovered
                ? widget.colors.primary
                : widget.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HERO AVATAR WITH DECORATIVE RING
// =============================================================================
class _HeroAvatar extends StatefulWidget {
  final String? imgAsset;
  final AppColorsOf colors;
  final double size;

  const _HeroAvatar({
    required this.imgAsset,
    required this.colors,
    required this.size,
  });

  @override
  State<_HeroAvatar> createState() => _HeroAvatarState();
}

class _HeroAvatarState extends State<_HeroAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      config: BaseAnimationConfig(
        delay: 300.ms,
        duration: 1000.ms,
        child: Center(
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Rotating decorative ring
                AnimatedBuilder(
                  animation: _rotateController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotateController.value * 2 * math.pi,
                      child: Container(
                        width: widget.size,
                        height: widget.size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                          gradient: SweepGradient(
                            colors: [
                              widget.colors.primary.withValues(alpha: 0.0),
                              widget.colors.primary.withValues(alpha: 0.3),
                              widget.colors.primary.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Inner ring border
                Container(
                  width: widget.size - 16,
                  height: widget.size - 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.colors.border,
                      width: 1,
                    ),
                  ),
                ),

                // Avatar circle with placeholder
                Container(
                  width: widget.size - 32,
                  height: widget.size - 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.colors.primary.withValues(alpha: 0.08),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.colors.primary.withValues(alpha: 0.12),
                        widget.colors.primary.withValues(alpha: 0.04),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person_rounded,
                      size: widget.size * 0.3,
                      color: widget.colors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                ),

                // Floating accent dots
                ..._buildAccentDots(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAccentDots() {
    return [
      Positioned(
        top: 20,
        right: 30,
        child: _DotAccent(size: 8, color: widget.colors.primary),
      ),
      Positioned(
        bottom: 40,
        left: 20,
        child: _DotAccent(
          size: 6,
          color: widget.colors.primary.withValues(alpha: 0.5),
        ),
      ),
      Positioned(
        bottom: 20,
        right: 50,
        child: _DotAccent(
          size: 10,
          color: widget.colors.primary.withValues(alpha: 0.3),
        ),
      ),
    ];
  }
}

class _DotAccent extends StatelessWidget {
  final double size;
  final Color color;

  const _DotAccent({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

// =============================================================================
// SCROLL DOWN INDICATOR
// =============================================================================
class _ScrollDownIndicator extends StatelessWidget {
  final AnimationController pulseController;
  final AppColorsOf colors;

  const _ScrollDownIndicator({
    required this.pulseController,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      config: BaseAnimationConfig(
        delay: 1200.ms,
        duration: 800.ms,
        child: AnimatedBuilder(
          animation: pulseController,
          builder: (context, child) {
            return Opacity(
              opacity: 0.4 + (pulseController.value * 0.4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Scroll Down',
                    style: AppTexts.txsm.withColor(colors.textMuted),
                  ),
                  const SizedBox(height: 6),
                  Transform.translate(
                    offset: Offset(0, pulseController.value * 4),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: colors.textMuted,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
