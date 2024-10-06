// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
      sectionOne:
          SectionOneDto.fromJson(json['sectionOne'] as Map<String, dynamic>),
      sectionTwo:
          SectionTwoDto.fromJson(json['sectionTwo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDtoToJson(EventDto instance) => <String, dynamic>{
      'sectionOne': instance.sectionOne,
      'sectionTwo': instance.sectionTwo,
    };
