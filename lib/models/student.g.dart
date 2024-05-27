// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      parentName: json['parentName'] as String?,
      parentEmail: json['parentEmail'] as String?,
      parentPhone: json['parentPhone'] as String?,
      photoUrl: json['photoUrl'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate?.toIso8601String(),
      'parentName': instance.parentName,
      'parentEmail': instance.parentEmail,
      'parentPhone': instance.parentPhone,
      'photoUrl': instance.photoUrl,
      'status': instance.status,
    };
