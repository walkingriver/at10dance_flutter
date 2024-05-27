import 'package:flutter/material.dart';
import 'main.dart';

class StudentDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Center(
        child: Text('Student Detail Screen'),
      ),
      showDrawer: false, // Don't show Drawer on StudentDetail Screen
    );
  }
}
