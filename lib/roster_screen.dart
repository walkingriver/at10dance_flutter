import 'package:flutter/material.dart';

import 'main.dart';

class RosterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Center(
        child: Text('Roster Screen'),
      ),
      showDrawer: true, // Show Drawer on Roster Screen
    );
  }
}
