// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentRow extends StatelessWidget {
  final Student student;

  final VoidCallback onDelete;
  final VoidCallback onDetails;
  final VoidCallback onTap;
  final VoidCallback onMore;

  const StudentRow({
    Key? key,
    required this.onDelete,
    required this.student,
    required this.onTap,
    required this.onDetails,
    required this.onMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(student.id),
      background: Container(color: Colors.red),
      onDismissed: (direction) {
        onDelete();
      },
      child: ListTile(
        leading: Icon(Icons.person_outline),
        title: Text('${student.lastName}, ${student.firstName}'),
        onTap: onTap,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (student.status == 'present') Icon(Icons.visibility),
            if (student.status == 'absent') Icon(Icons.visibility_off),
            IconButton(icon: Icon(Icons.more_vert), onPressed: onMore),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: onDetails,
            ),
          ],
        ),
      ),
    );
  }
}
