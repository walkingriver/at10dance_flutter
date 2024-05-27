import 'package:flutter/material.dart';
import '../main.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Center(
        child: Text('Settings Screen'),
      ),
      showDrawer: true, // Show Drawer on Settings Screen
    );
  }
}
