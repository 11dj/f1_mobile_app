// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) => Meeting(
      circuitKey: (json['circuit_key'] as num?)?.toInt(),
      circuitShortName: json['circuit_short_name'] as String?,
      countryCode: json['country_code'] as String?,
      countryKey: (json['country_key'] as num?)?.toInt(),
      countryName: json['country_name'] as String?,
      dateStart: json['date_start'] as String?,
      gmtOffset: json['gmt_offset'] as String?,
      location: json['location'] as String?,
      meetingKey: (json['meeting_key'] as num?)?.toInt(),
      meetingName: json['meeting_name'] as String?,
      meetingOfficialName: json['meeting_official_name'] as String?,
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
      'circuit_key': instance.circuitKey,
      'circuit_short_name': instance.circuitShortName,
      'country_code': instance.countryCode,
      'country_key': instance.countryKey,
      'country_name': instance.countryName,
      'date_start': instance.dateStart,
      'gmt_offset': instance.gmtOffset,
      'location': instance.location,
      'meeting_key': instance.meetingKey,
      'meeting_name': instance.meetingName,
      'meeting_official_name': instance.meetingOfficialName,
      'year': instance.year,
    };

_$MeetingImpl _$$MeetingImplFromJson(Map<String, dynamic> json) =>
    _$MeetingImpl(
      circuitKey: (json['circuitKey'] as num?)?.toInt(),
      circuitShortName: json['circuitShortName'] as String?,
      countryCode: json['countryCode'] as String?,
      countryKey: (json['countryKey'] as num?)?.toInt(),
      countryName: json['countryName'] as String?,
      dateStart: json['dateStart'] as String?,
      gmtOffset: json['gmtOffset'] as String?,
      location: json['location'] as String?,
      meetingKey: (json['meetingKey'] as num?)?.toInt(),
      meetingName: json['meetingName'] as String?,
      meetingOfficialName: json['meetingOfficialName'] as String?,
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MeetingImplToJson(_$MeetingImpl instance) =>
    <String, dynamic>{
      'circuitKey': instance.circuitKey,
      'circuitShortName': instance.circuitShortName,
      'countryCode': instance.countryCode,
      'countryKey': instance.countryKey,
      'countryName': instance.countryName,
      'dateStart': instance.dateStart,
      'gmtOffset': instance.gmtOffset,
      'location': instance.location,
      'meetingKey': instance.meetingKey,
      'meetingName': instance.meetingName,
      'meetingOfficialName': instance.meetingOfficialName,
      'year': instance.year,
    };
