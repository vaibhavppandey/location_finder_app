import "package:json_annotation/json_annotation.dart";

part "current_location.g.dart";

@JsonSerializable()
class CurrentLocation {
  CurrentLocation(
      this.ip, this.location, this.regionName, this.isp, this.proxy);

  final String ip;
  @JsonKey(name: 'location')
  final String location;
  final String regionName;
  final String isp;
  @JsonKey(defaultValue: false)
  final bool proxy;

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      _$CurrentLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLocationToJson(this);
}
