import 'package:flutter/material.dart';

/// A model representing an item in the [CmxCapsuleNav].
class CmxCapsuleNavItem {
  /// The icon to display for this item.
  final IconData icon;

  /// An optional label for the item (not displayed in the current design but useful for accessibility).
  final String? label;

  /// Creates a [CmxCapsuleNavItem].
  const CmxCapsuleNavItem({required this.icon, this.label});
}
