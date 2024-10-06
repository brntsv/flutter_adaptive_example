// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_one_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionOneDto _$SectionOneDtoFromJson(Map<String, dynamic> json) =>
    SectionOneDto(
      subsections: (json['subsections'] as List<dynamic>)
          .map((e) => SubsectionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionOneDtoToJson(SectionOneDto instance) =>
    <String, dynamic>{
      'subsections': instance.subsections,
    };
