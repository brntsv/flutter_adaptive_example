// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linear_gradient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinearGradientDto _$LinearGradientDtoFromJson(Map<String, dynamic> json) =>
    LinearGradientDto(
      start: GradientColorDto.fromJson(json['start'] as Map<String, dynamic>),
      end: GradientColorDto.fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinearGradientDtoToJson(LinearGradientDto instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
