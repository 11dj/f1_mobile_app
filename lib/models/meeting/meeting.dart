import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting.freezed.dart';
part 'meeting.g.dart';

@freezed
class Meeting with _$Meeting {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Meeting({
    required int circuitKey,
    required String circuitShortName,
    required String countryCode,
    required int countryKey,
    required String countryName,
    required String dateStart,
    required String gmtOffset,
    required String location,
    required int meetingKey,
    required String meetingName,
    required String meetingOfficialName,
    required int year,
  }) = _Meeting;

  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);
}
