import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_member.freezed.dart';
part 'team_member.g.dart';

@freezed
class TeamMember with _$TeamMember {
  const factory TeamMember({
    required String name,
    required String imagePath,
    required String description,
  }) = _TeamMember;

  factory TeamMember.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberFromJson(json);

  factory TeamMember.mock({
    String name = 'Kovács Péter',
    String imagePath = 'assets/images/profil.png',
    String description = 'Énekes',
  }) {
    return TeamMember(
      name: name,
      imagePath: imagePath,
      description: description,
    );
  }
}
