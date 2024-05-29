import 'package:at10dance_flutter/models/student.dart';
import 'package:at10dance_flutter/models/student.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class StudentList extends Notifier<List<Student>> {
  @override
  List<Student> build() {
    return mockStudents;
  }

  void add(Student student) {
    state = [...state, student];
  }

  void remove(Student student) {
    state = state.where((s) => s.id != student.id).toList();
  }

  void update(Student student) {
    state = state.map((s) => s.id == student.id ? student : s).toList();
  }

  void addBulk(List<Student> students) {
    state = [...state, ...students];
  }
}
