import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cmx_capsule_nav/cmx_capsule_nav.dart';

void main() {
  const items = [
    CmxCapsuleNavItem(icon: Icons.home, label: 'Home'),
    CmxCapsuleNavItem(icon: Icons.chat, label: 'Chat'),
    CmxCapsuleNavItem(icon: Icons.person, label: 'Profile'),
  ];

  testWidgets('CmxCapsuleNav renders correctly', (WidgetTester tester) async {
    int selectedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CmxCapsuleNav(
            currentIndex: selectedIndex,
            items: items,
            onTap: (index) => selectedIndex = index,
          ),
        ),
      ),
    );

    // Verify icons are present
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.chat), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('CmxCapsuleNav handles taps', (WidgetTester tester) async {
    int selectedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CmxCapsuleNav(
            currentIndex: selectedIndex,
            items: items,
            onTap: (index) => selectedIndex = index,
          ),
        ),
      ),
    );

    // Tap on the second item (Chat)
    await tester.tap(find.byIcon(Icons.chat));
    await tester.pumpAndSettle();

    // Verify onTap was called
    expect(selectedIndex, 1);
  });

  testWidgets('CmxCapsuleNav theme is applied', (WidgetTester tester) async {
    const customTheme = CmxCapsuleNavTheme(
      activeColor: Colors.red,
      inactiveColor: Colors.blue,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CmxCapsuleNav(
            currentIndex: 0,
            items: items,
            onTap: (index) {},
            theme: customTheme,
          ),
        ),
      ),
    );

    // Find the active bubble container (it has the activeColor)
    bool foundActiveColor = false;

    for (final element in tester.allElements) {
      if (element.widget is Container) {
        final container = element.widget as Container;
        if (container.decoration is BoxDecoration) {
          final decoration = container.decoration as BoxDecoration;
          if (decoration.color == Colors.red) {
            foundActiveColor = true;
            break;
          }
        }
      }
    }

    expect(foundActiveColor, true);
  });
}
