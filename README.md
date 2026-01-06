# cmx_capsule_nav

A beautiful, custom animated floating capsule-style navigation bar for Flutter.

## Features

- **Floating Design**: A modern, floating capsule-style navigation bar.
- **Smooth Animations**: Morphing effects when switching between items.
- **Highly Configurable**: Customize colors, icons, animations, shadows, and more.
- **Theme Support**: Easily integrate with your app's theme.

## Getting started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  cmx_capsule_nav: ^0.0.1
```

## Usage

```dart
import 'package:cmx_capsule_nav/cmx_capsule_nav.dart';

CmxCapsuleNav(
  currentIndex: _selectedIndex,
  items: [
    CmxCapsuleNavItem(icon: Icons.home_outlined),
    CmxCapsuleNavItem(icon: Icons.chat_bubble_outline),
    CmxCapsuleNavItem(icon: Icons.person_outline),
  ],
  onTap: (index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  theme: CmxCapsuleNavTheme.defaultTheme(context),
)
```

## Configuration

You can fully customize the navigation bar using the `CmxCapsuleNavTheme` class:

| Parameter | Description | Default |
|-----------|-------------|---------|
| `activeColor` | Background color of the active bubble | `Color(0xFF7B7BFF)` |
| `inactiveColor` | Background color of inactive capsules | `Color(0xFF7B7BFF)` |
| `activeIconColor` | Color of the active icon | `Colors.white` |
| `inactiveIconColor` | Color of inactive icons | `Colors.white` |
| `animationDuration` | Duration of the morphing animation | `600ms` |
| `animationCurve` | Curve of the morphing animation | `Curves.easeOutExpo` |
| `maxWidth` | Maximum width of the navigation bar | `220.0` |

## License

MIT
