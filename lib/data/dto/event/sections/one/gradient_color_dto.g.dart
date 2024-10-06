// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_color_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientColorDto _$GradientColorDtoFromJson(Map<String, dynamic> json) =>
    GradientColorDto(
      color: json['color'] as String,
      opacity: (json['opacity'] as num).toInt(),
      stop: (json['stop'] as num).toInt(),
    );

Map<String, dynamic> _$GradientColorDtoToJson(GradientColorDto instance) =>
    <String, dynamic>{
      'color': instance.color,
      'opacity': instance.opacity,
      'stop': instance.stop,
    };
