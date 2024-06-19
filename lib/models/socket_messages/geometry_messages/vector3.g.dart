// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vector3 _$Vector3FromJson(Map<String, dynamic> json) => Vector3(
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
      z: (json['z'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$Vector3ToJson(Vector3 instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };
