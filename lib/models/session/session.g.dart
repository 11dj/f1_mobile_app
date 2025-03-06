// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      circuitKey: (json['circuit_key'] as num).toInt(),
      circuitShortName: json['circuit_short_name'] as String,
      countryCode: json['country_code'] as String,
      countryKey: (json['country_key'] as num).toInt(),
      countryName: json['country_name'] as String,
      dateEnd: DateTime.parse(json['date_end'] as String),
      dateStart: DateTime.parse(json['date_start'] as String),
      gmtOffset: Duration(microseconds: (json['gmt_offset'] as num).toInt()),
      location: json['location'] as String,
      meetingKey: (json['meeting_key'] as num).toInt(),
      sessionKey: (json['session_key'] as num).toInt(),
      sessionName: json['session_name'] as String,
      sessionType: json['session_type'] as String,
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'circuit_key': instance.circuitKey,
      'circuit_short_name': instance.circuitShortName,
      'country_code': instance.countryCode,
      'country_key': instance.countryKey,
      'country_name': instance.countryName,
      'date_end': instance.dateEnd.toIso8601String(),
      'date_start': instance.dateStart.toIso8601String(),
      'gmt_offset': instance.gmtOffset.inMicroseconds,
      'location': instance.location,
      'meeting_key': instance.meetingKey,
      'session_key': instance.sessionKey,
      'session_name': instance.sessionName,
      'session_type': instance.sessionType,
      'year': instance.year,
    };
