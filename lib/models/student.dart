import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    required String id,
    required String firstName,
    required String lastName,
    DateTime? birthDate,
    String? parentName,
    String? parentEmail,
    String? parentPhone,
    String? photoUrl,
    String? status,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
