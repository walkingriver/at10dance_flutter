import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
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
                  },
                  onDetails: () {
                    // Navigate to student detail page
                  },
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      showDrawer: true, // Show Drawer on Roster Screen
    );
  }
}
