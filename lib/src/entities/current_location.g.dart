// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentLocation _$CurrentLocationFromJson(Map<String, dynamic> json) =>
    CurrentLocation(
      json['ip'] as String,
      json['location'] as String,
      json['regionName'] as String,
      json['isp'] as String,
      json['proxy'] as bool? ?? false,
    );

Map<String, dynamic> _$CurrentLocationToJson(CurrentLocation instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'location': instance.location,
      'regionName': instance.regionName,
      'isp': instance.isp,
      'proxy': instance.proxy,
    };
