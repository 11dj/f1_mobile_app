import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting.freezed.dart';
part 'meeting.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Meeting with _$Meeting {
  const factory Meeting({
    int? circuitKey,
    String? circuitShortName,
    String? countryCode,
    int? countryKey,
    String? countryName,
    String? dateStart,
    String? gmtOffset,
    String? location,
    int? meetingKey,
    String? meetingName,
    String? meetingOfficialName,
    int? year,
  }) = _Meeting;

  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);
}
