// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String,
      creationTime: DateTime.parse(json['creationTime'] as String),
      imagePath: json['imagePath'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      location: json['location'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) => <String, dynamic>{
      'id': instance.id,
      'creationTime': instance.creationTime.toIso8601String(),
      'imagePath': instance.imagePath,
      'name': instance.name,
      'description': instance.description,
      'startTime': instance.startTime.toIso8601String(),
      'location': instance.location,
      'type': _$EventTypeEnumMap[instance.type]!,
    };

const _$EventTypeEnumMap = {
  EventType.praising: 'praising',
  EventType.youngPrayingCamp: 'youngPrayingCamp',
  EventType.adultPrayingCamp: 'adultPrayingCamp',
  EventType.general: 'general',
};
