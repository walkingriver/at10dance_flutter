import 'package:at10dance_flutter/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.provider.dart';

class StudentDetailScreen extends ConsumerWidget {
  final Student? initialStudent;

  const StudentDetailScreen({super.key, this.initialStudent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();

    if (initialStudent == null) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      return Container(); // Return an empty container
    }

    Student _studentCopy = initialStudent!.copyWith();

    // Set up controllers for the form
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController parentNameController = TextEditingController();
    final TextEditingController parentEmailController = TextEditingController();
    final TextEditingController parentPhoneController = TextEditingController();
    final TextEditingController photoUrlController = TextEditingController();

    // Set initial values
    firstNameController.text = _studentCopy.firstName;
    lastNameController.text = _studentCopy.lastName;
    parentNameController.text = _studentCopy.parentName ?? '';
    parentEmailController.text = _studentCopy.parentEmail ?? '';
    parentPhoneController.text = _studentCopy.parentPhone ?? '';
    photoUrlController.text = _studentCopy.photoUrl ?? '';

    // Set up listeners
    firstNameController.addListener(() {
      _studentCopy = _studentCopy.copyWith(firstName: firstNameController.text);
    });
    lastNameController.addListener(() {
      _studentCopy = _studentCopy.copyWith(lastName: lastNameController.text);
    });
    parentNameController.addListener(() {
      _studentCopy =
          _studentCopy.copyWith(parentName: parentNameController.text);
    });
    parentEmailController.addListener(() {
      _studentCopy =
          _studentCopy.copyWith(parentEmail: parentEmailController.text);
    });
    parentPhoneController.addListener(() {
      _studentCopy =
          _studentCopy.copyWith(parentPhone: parentPhoneController.text);
    });
    photoUrlController.addListener(() {
      _studentCopy = _studentCopy.copyWith(photoUrl: photoUrlController.text);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(_studentCopy.lastName + ', ' + _studentCopy.firstName),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              ref.read(studentListProvider.notifier).update(_studentCopy);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        // Set up the form
        child: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                  TextFormField(
                    controller: parentNameController,
                    decoration: InputDecoration(labelText: 'Parent Name'),
                  ),
                  TextFormField(
                    controller: parentEmailController,
                    decoration: InputDecoration(labelText: 'Parent Email'),
                  ),
                  TextFormField(
                    controller: parentPhoneController,
                    decoration: InputDecoration(labelText: 'Parent Phone'),
                  ),
                  TextFormField(
                    controller: photoUrlController,
                    decoration: InputDecoration(labelText: 'Photo URL'),
                    enabled: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
