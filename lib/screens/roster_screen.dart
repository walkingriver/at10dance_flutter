import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../models/student.dart';
import '../models/student.provider.dart';
import 'student_row.dart';

class RosterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(allStudentsProvider);

    return AppShell(
      child: students.hasValue
          ? ListView.builder(
              itemCount: students.value?.length,
              itemBuilder: (context, index) {
                final student = students.value![index];
                return StudentRow(
                  student: student,
                  onDelete: () {
                    // Delete student
                    print(
                        'Student deleted: ${student.lastName}, ${student.firstName}');
                  },
                  onDetails: () {
                    // Navigate to student detail page
                    print(
                        'Student details: ${student.lastName}, ${student.firstName}');
                  },
                  onMore: () {
                    // Show action sheet
                    _presentActionSheet(context, student);
                  },
                  onTap: () {
                    // Show action sheet
                    _presentActionSheet(context, student);
                  },
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      showDrawer: true, // Show Drawer on Roster Screen
    );
  }

  void _presentActionSheet(BuildContext context, Student student) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Mark Present Button
            ListTile(
              leading: Icon(Icons.visibility),
              title: Text('Mark Present'),
              onTap: () {
                // Mark Present
                print(
                    'Mark Present: ${student.lastName}, ${student.firstName}');
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
                print('Mark Absent: ${student.lastName}, ${student.firstName}');
                // Dismiss the bottom sheet
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                // Delete student
                print(
                    'Student deleted: ${student.lastName}, ${student.firstName}');
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
