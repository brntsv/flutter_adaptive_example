// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_two_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionTwoDto _$SectionTwoDtoFromJson(Map<String, dynamic> json) =>
    SectionTwoDto(
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionTwoDtoToJson(SectionTwoDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'items': instance.items,
    };
