import 'package:json_annotation/json_annotation.dart';

part 'vector3.g.dart';

@JsonSerializable()
class Vector3 {
  /// This represents a vector in free space.
  /// It is only meant to represent a direction. Therefore, it does not
  /// make sense to apply a translation to it (e.g., when applying a
  /// generic rigid transformation to a Vector3, tf2 will only apply the
  /// rotation). If you want your data to be translatable too, use the
  /// geometry_msgs/Point message instead.

  Vector3({
    this.x = 0.0,
    this.y = 0.0,
    this.z = 0.0,
  });

  double x;
  double y;
  double z;

  factory Vector3.fromJson(Map<String, dynamic> json) =>
      _$Vector3FromJson(json);
  Map<String, dynamic> toJson() => _$Vector3ToJson(this);

  Vector3 copyWith({
    double? x,
    double? y,
    double? z,
  }) {
    return Vector3(
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
    );
  }
}
