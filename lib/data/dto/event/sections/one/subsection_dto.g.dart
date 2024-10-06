// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subsection_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubsectionDto _$SubsectionDtoFromJson(Map<String, dynamic> json) =>
    SubsectionDto(
      headers: (json['headers'] as List<dynamic>)
          .map((e) => HeaderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String,
      linearGradient: json['linearGradient'] == null
          ? null
          : LinearGradientDto.fromJson(
              json['linearGradient'] as Map<String, dynamic>),
      buttonText: json['buttonText'] as String?,
    );

Map<String, dynamic> _$SubsectionDtoToJson(SubsectionDto instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'image': instance.image,
      'linearGradient': instance.linearGradient,
      'buttonText': instance.buttonText,
    };
