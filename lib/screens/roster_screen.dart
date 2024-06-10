import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../models/student.dart';
import '../models/student.provider.dart';
import 'student_details_screen.dart';
import 'student_row.dart';

class RosterScreenKeys {
  static final rosterScreen = Key('rosterScreen');
  static final studentList = Key('studentList');
  static final studentRow = Key('studentRow');
  static final actionSheet = Key('actionSheet');
}

class RosterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentListProvider);

    return AppShell(
      key: RosterScreenKeys.rosterScreen,
      child: students.length > 0
          ? ListView.builder(
              key: RosterScreenKeys.studentList,
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return StudentRow(
                  student: student,
                  onDelete: () {
                    // Delete student
                    // students.remove(student);
                    ref.read(studentListProvider.notifier).remove(student);
                  },
                  onDetails: () {
                    // Use Go Router to Navigate to student detail page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentDetailScreen(initialStudent: student)));
                  },
                  onMore: () {
                    // Show action sheet
                    _presentActionSheet(context, student, ref);
                  },
                  onTap: () {
                    // Show action sheet
                  },
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      showDrawer: true, // Show Drawer on Roster Screen
    );
  }

  void _presentActionSheet(
    BuildContext context,
    Student student,
    WidgetRef ref,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          key: RosterScreenKeys.actionSheet,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Start with the student name as a "title"
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ListTile(
                title: Text(
                  'Student: ${student.lastName}, ${student.firstName}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(),
            // Mark Present Button
            ListTile(
              leading: Icon(Icons.visibility),
              title: Text('Mark Present'),
              onTap: () {
                // Mark Present
                // Dismiss the bottom sheet
                Navigator.pop(context);
              },
            ),
            // Mark Absent Button
            ListTile(
              leading: Icon(Icons.visibility_off),
              title: Text('Mark Absent'),
              onTap: () {
                // Mark Absent
                // Dismiss the bottom sheet
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                // Delete student
                ref.read(studentListProvider.notifier).remove(student);
                // Dismiss the bottom sheet
                Navigator.pop(context);
              },
            ),
            // Cancel button
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text('Cancel'),
              onTap: () {
                // Dismiss the bottom sheet
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
