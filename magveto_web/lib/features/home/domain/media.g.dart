// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      musicFilePath: json['musicFilePath'] as String,
      artist: json['artist'] as String?,
      musicalSheetPath: json['musicalSheetPath'] as String?,
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'musicFilePath': instance.musicFilePath,
      'artist': instance.artist,
      'musicalSheetPath': instance.musicalSheetPath,
    };
