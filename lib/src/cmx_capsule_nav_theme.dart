import 'package:flutter/material.dart';

/// Theme configuration for [CmxCapsuleNav].
class CmxCapsuleNavTheme {
  /// The background color of the active item bubble.
  final Color activeColor;

  /// The background color of the inactive item capsules.
  final Color inactiveColor;

  /// The color of the icon when the item is active.
  final Color activeIconColor;

  /// The color of the icon when the item is inactive.
  final Color inactiveIconColor;

  /// The duration of the animations.
  final Duration animationDuration;

  /// The curve of the animations.
  final Curve animationCurve;

  /// The height of the navigation bar container.
  final double barHeight;

  /// The height of the capsules/bubbles.
  final double bubbleHeight;

  /// The width of the active item bubble.
  final double activeWidth;

  /// The margin around the navigation bar.
  final EdgeInsets margin;

  /// The maximum width of the navigation bar.
  final double maxWidth;

  /// The shadow applied to the active bubble.
  final List<BoxShadow>? activeShadow;

  /// The shadow applied to the inactive capsules.
  final List<BoxShadow>? inactiveShadow;

  /// Creates a [CmxCapsuleNavTheme].
  const CmxCapsuleNavTheme({
    this.activeColor = const Color(0xFF7B7BFF),
    this.inactiveColor = const Color(0xFF7B7BFF),
    this.activeIconColor = Colors.white,
    this.inactiveIconColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 600),
    this.animationCurve = Curves.easeOutExpo,
    this.barHeight = 80.0,
    this.bubbleHeight = 60.0,
    this.activeWidth = 60.0,
    this.margin = const EdgeInsets.fromLTRB(24, 0, 24, 32),
    this.maxWidth = 220.0,
    this.activeShadow,
    this.inactiveShadow,
  });

  /// Default theme matching the original design.
  factory CmxCapsuleNavTheme.defaultTheme(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return CmxCapsuleNavTheme(
      activeColor: primaryColor,
      inactiveColor: primaryColor,
      activeShadow: [
        BoxShadow(
          color: primaryColor.withValues(
            alpha: (0.4 * 255).roundToDouble() / 255,
          ),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
      inactiveShadow: [
        BoxShadow(
          color: primaryColor.withValues(
            alpha: (0.2 * 255).roundToDouble() / 255,
          ),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }
}
