import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../models/student.dart';
import '../models/student.provider.dart';
import 'student_row.dart';

class RosterActionSheetCallbacks {
  final Function(Student) onPresent;
  final Function(Student) onAbsent;
  final Function(Student) onDelete;
  final Function() onCancel;

  const RosterActionSheetCallbacks({
    required this.onPresent,
    required this.onAbsent,
    required this.onDelete,
    required this.onCancel,
  });
}

class RosterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentListProvider);

    return AppShell(
      child: students.length > 0
          ? ListView.builder(
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
                    // Navigate to student detail page
                    print(
                        'Student details: ${student.lastName}, ${student.firstName}');
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
