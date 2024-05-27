import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'student.dart';
part 'student.provider.g.dart';

final List<Student> mockStudents = [
  Student(id: '1', firstName: 'Greg', lastName: 'Marine'),
  Student(id: '2', firstName: 'Jonathan', lastName: 'Bennett'),
  Student(id: '3', firstName: 'Neil', lastName: 'Estandarte'),
  Student(id: '4', firstName: 'Jen', lastName: 'Townsend'),
  Student(id: '5', firstName: 'Casey', lastName: 'McBride'),
  Student(id: '6', firstName: 'Diane', lastName: 'Rivera'),
  Student(id: '7', firstName: 'Troy', lastName: 'Gutierrez'),
  Student(id: '8', firstName: 'Priscilla', lastName: 'Little'),
  Student(id: '9', firstName: 'Bobby', lastName: 'Robbins'),
  Student(id: '10', firstName: 'Edmund', lastName: 'Gardner'),
];

@riverpod
Future<List<Student>> allStudents(AllStudentsRef ref) async {
  // Simulate fetching student data from an API or database
  await Future.delayed(Duration(seconds: 1));
  return mockStudents; // assuming mockStudents is your list of students
}
