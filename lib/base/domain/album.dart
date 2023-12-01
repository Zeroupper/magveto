import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    required String id,
    required String name,
    required DateTime createdAt,
    required List<String> images,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  factory Album.mock({
    String id = '1',
    DateTime? createdAt,
    String name = 'Vörös Péter bazilika',
    String? images,
  }) {
    return Album(
      id: id,
      createdAt: DateTime.now(),
      name: name,
      images: [
        'assets/images/small_group.jpg',
        'assets/images/big_group.jpg',
        'assets/images/praise_group.jpg',
        'assets/images/profil_group.jpg',
      ],
    );
  }
}
