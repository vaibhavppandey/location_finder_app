// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentLocation _$CurrentLocationFromJson(Map<String, dynamic> json) =>
    CurrentLocation(
      json['query'] as String,
      json['country'] as String,
      json['regionName'] as String,
      json['isp'] as String,
      json['proxy'] as bool? ?? false,
    );

Map<String, dynamic> _$CurrentLocationToJson(CurrentLocation instance) =>
    <String, dynamic>{
      'country': instance.location,
      'regionName': instance.regionName,
      'isp': instance.isp,
      'proxy': instance.proxy,
      'query': instance.ip,
    };
