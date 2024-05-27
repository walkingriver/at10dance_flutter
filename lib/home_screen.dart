import 'package:flutter/material.dart';

import 'main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Center(
        child: Text('Home Screen'),
      ),
      showDrawer: true, // Show Drawer on Home Screen
    );
  }
}
