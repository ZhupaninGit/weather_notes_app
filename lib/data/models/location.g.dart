// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
      description: json['description'] as String,
      placeId: json['placeId'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
      'description': instance.description,
      'placeId': instance.placeId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
