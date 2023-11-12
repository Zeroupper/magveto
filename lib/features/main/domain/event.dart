import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required DateTime creationTime,
    required String imagePath,
    required String name,
    required String description,
    required DateTime startTime,
    required String location,
    required EventType type,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  factory Event.mock({
    String id = '1',
    DateTime? creationTime,
    String imagePath = 'assets/images/small_group.jpg',
    String name = 'Vörös Péter bazilika',
    String description = 'Megtartjuk a 2. heti dicsőítést is. Gyertek bátran!',
    String location = 'Nagykanizsa, Kossuth Lajos tér 22',
    EventType type = EventType.general,
    DateTime? startTime,
  }) {
    return Event(id: id, creationTime: DateTime.now(), imagePath: imagePath, name: name, description: description, startTime: DateTime.now(), location: location, type: type);
  }
}

enum EventType { praising, youngPrayingCamp, adultPrayingCamp, general }
