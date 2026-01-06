import 'package:flutter/material.dart';
import 'cmx_capsule_nav_item.dart';
import 'cmx_capsule_nav_theme.dart';

/// A custom animated floating capsule-style navigation bar.
class CmxCapsuleNav extends StatelessWidget {
  /// The index of the currently selected item.
  final int currentIndex;

  /// Callback when an item is tapped.
  final ValueChanged<int> onTap;

  /// The list of items to display in the navigation bar.
  final List<CmxCapsuleNavItem> items;

  /// The theme configuration for the navigation bar.
  final CmxCapsuleNavTheme theme;

  /// Creates a [CmxCapsuleNav].
  const CmxCapsuleNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.theme = const CmxCapsuleNavTheme(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: theme.barHeight,
      margin: theme.margin,
      child: Center(
        child: SizedBox(
          width: theme.maxWidth,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final itemCount = items.length;
              final spacing = totalWidth / itemCount;
              final bubbleHeight = theme.bubbleHeight;
              final activeWidth = theme.activeWidth;

              return Stack(
                alignment: Alignment.center,
                children: [
                  // Inactive Group 1 (Left of active)
                  if (currentIndex > 0)
                    AnimatedPositioned(
                      duration: theme.animationDuration,
                      curve: theme.animationCurve,
                      left: 0,
                      top: (theme.barHeight - bubbleHeight) / 2,
                      child: AnimatedContainer(
                        duration: theme.animationDuration,
                        curve: theme.animationCurve,
                        width: currentIndex * spacing,
                        height: bubbleHeight,
                        decoration: BoxDecoration(
                          color: theme.inactiveColor,
                          borderRadius: BorderRadius.circular(bubbleHeight / 2),
                          boxShadow: theme.inactiveShadow,
                        ),
                      ),
                    ),

                  // Inactive Group 2 (Right of active)
                  if (currentIndex < itemCount - 1)
                    AnimatedPositioned(
                      duration: theme.animationDuration,
                      curve: theme.animationCurve,
                      right: 0,
                      top: (theme.barHeight - bubbleHeight) / 2,
                      child: AnimatedContainer(
                        duration: theme.animationDuration,
                        curve: theme.animationCurve,
                        width: (itemCount - 1 - currentIndex) * spacing,
                        height: bubbleHeight,
                        decoration: BoxDecoration(
                          color: theme.inactiveColor,
                          borderRadius: BorderRadius.circular(bubbleHeight / 2),
                          boxShadow: theme.inactiveShadow,
                        ),
                      ),
                    ),

                  // Active Bubble
                  AnimatedPositioned(
                    duration: theme.animationDuration,
                    curve: theme.animationCurve,
                    left:
                        (currentIndex * spacing) + (spacing - activeWidth) / 2,
                    top: (theme.barHeight - bubbleHeight) / 2,
                    child: Container(
                      width: activeWidth,
                      height: bubbleHeight,
                      decoration: BoxDecoration(
                        color: theme.activeColor,
                        borderRadius: BorderRadius.circular(bubbleHeight / 2),
                        boxShadow: theme.activeShadow,
                      ),
                    ),
                  ),

                  // Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(itemCount, (index) {
                      final isActive = index == currentIndex;
                      return GestureDetector(
                        onTap: () => onTap(index),
                        behavior: HitTestBehavior.opaque,
                        child: SizedBox(
                          width: spacing,
                          height: theme.barHeight,
                          child: Center(
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 400),
                              scale: isActive ? 1.1 : 1.0,
                              child: Icon(
                                items[index].icon,
                                color: isActive
                                    ? theme.activeIconColor
                                    : theme.inactiveIconColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
