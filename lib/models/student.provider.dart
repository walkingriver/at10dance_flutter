import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'student.dart';
import 'student_list.dart';
part 'student.provider.g.dart';

@riverpod
Future<List<Student>> allStudents(AllStudentsRef ref) async {
  // Simulate fetching student data from an API or database
  await Future.delayed(Duration(seconds: 1));
  return mockStudents; // assuming mockStudents is your list of students
}

// Create a StudentList from mockStudents and return as a provider
final studentListProvider =
    NotifierProvider<StudentList, List<Student>>(StudentList.new);
