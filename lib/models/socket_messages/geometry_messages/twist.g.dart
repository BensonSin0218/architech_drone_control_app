// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Twist _$TwistFromJson(Map<String, dynamic> json) => Twist(
      linear: json['linear'] == null
          ? null
          : Vector3.fromJson(json['linear'] as Map<String, dynamic>),
      angular: json['angular'] == null
          ? null
          : Vector3.fromJson(json['angular'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TwistToJson(Twist instance) => <String, dynamic>{
      'linear': instance.linear,
      'angular': instance.angular,
    };
