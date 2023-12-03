import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  const factory Media({
    required String id,
    required String name,
    required String musicFilePath,
    String? artist,
    String? musicalSheetPath,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  factory Media.mock({
    String id = '1',
    String name = 'Meghívtál hogy vízre lépjek',
    String musicFilePath = '',
    String? musicalSheetPath,
    String? artist = 'Magvető',
  }) {
    return Media(
      id: id,
      name: name,
      musicFilePath: musicFilePath,
      musicalSheetPath: musicalSheetPath,
      artist: artist,
    );
  }
}
