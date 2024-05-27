import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentRow extends StatelessWidget {
  final Student student;
  final VoidCallback onDelete;
  final VoidCallback onDetails;

  const StudentRow({
    Key? key,
    required this.student,
    required this.onDelete,
    required this.onDetails,
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (student.status == 'present') Icon(Icons.visibility),
            if (student.status == 'absent') Icon(Icons.visibility_off),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                _presentActionSheet(context, student);
              },
            ),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: onDetails,
            ),
          ],
        ),
      ),
    );
  }

  void _presentActionSheet(BuildContext context, Student student) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                onDelete();
              },
            ),
            // Add more actions here
          ],
        );
      },
    );
  }
}
