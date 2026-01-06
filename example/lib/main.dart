import 'package:flutter/material.dart';
import 'package:cmx_capsule_nav/cmx_capsule_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMX Capsule Nav Example',
      theme: ThemeData(
        primaryColor: const Color(0xFF7B7BFF),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<CmxCapsuleNavItem> _items = const [
    CmxCapsuleNavItem(icon: Icons.home_outlined, label: 'Home'),
    CmxCapsuleNavItem(icon: Icons.chat_bubble_outline, label: 'Chat'),
    CmxCapsuleNavItem(icon: Icons.person_outline, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CMX Capsule Nav'), centerTitle: true),
      body: Center(
        child: Text(
          'Selected Index: $_currentIndex',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CmxCapsuleNav(
        currentIndex: _currentIndex,
        items: _items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        theme: CmxCapsuleNavTheme.defaultTheme(context),
      ),
    );
  }
}
