import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory Session({
    required int circuitKey,
    required String circuitShortName,
    required String countryCode,
    required int countryKey,
    required String countryName,
    required DateTime dateEnd,
    required DateTime dateStart,
    required Duration gmtOffset,
    required String location,
    required int meetingKey,
    required int sessionKey,
    required String sessionName,
    required String sessionType,
    required int year,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson({
        ...json,
        'date_end': json['date_end'] as String,
        'date_start': json['date_start'] as String,
        'gmt_offset': _parseGmtOffset(json['gmt_offset'] as String),
      });

  static Duration _parseGmtOffset(String offset) {
    final parts = offset.split(':');
    return Duration(
      hours: int.parse(parts[0]),
      minutes: int.parse(parts[1]),
    );
  }
}
