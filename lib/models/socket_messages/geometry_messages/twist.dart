import 'package:architech_drone_control_app/models/socket_messages/geometry_messages/vector3.dart';
import 'package:json_annotation/json_annotation.dart';

part 'twist.g.dart';

@JsonSerializable()
class Twist {
  /// This expresses velocity in free space broken into its linear and angular parts.

  Twist({
    Vector3? linear,
    Vector3? angular,
  })  : linear = linear ?? Vector3(),
        angular = angular ?? Vector3();

  final Vector3 linear;
  final Vector3 angular;

  factory Twist.fromJson(Map<String, dynamic> json) => _$TwistFromJson(json);
  Map<String, dynamic> toJson() => _$TwistToJson(this);

  Twist copyWith({
    Vector3? linear,
    Vector3? angular,
  }) {
    return Twist(
      linear: linear ?? this.linear,
      angular: angular ?? this.angular,
    );
  }
}
