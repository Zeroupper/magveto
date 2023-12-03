import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    required String text,
    required String reviewer,
    required DateTime createdAt,
    String? description,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  factory Review.mock({
    String id = '1',
    DateTime? creationTime,
    String text =
        'Sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis Lorem ipsum dolor sit amet consectetur.',
    String reviewer = 'Peti',
    String description = 'Imatáboros',
  }) {
    return Review(
      id: id,
      createdAt: DateTime.now(),
      description: description,
      text: text,
      reviewer: reviewer,
    );
  }
}
