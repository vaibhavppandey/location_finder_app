import "package:json_annotation/json_annotation.dart";

part "current_location.g.dart";

@JsonSerializable()
class CurrentLocation {
  CurrentLocation(
      this.ip, this.location, this.regionName, this.isp, this.proxy);

  @JsonKey(name: 'country')
  final String location;
  final String regionName;
  final String isp;
  @JsonKey(defaultValue: false)
  final bool proxy;
  @JsonKey(name: 'query')
  final String ip;

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      _$CurrentLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLocationToJson(this);
}
