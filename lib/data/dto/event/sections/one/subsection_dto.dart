import 'package:equatable/equatable.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/header_dto.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/linear_gradient_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subsection_dto.g.dart';

@JsonSerializable()
class SubsectionDto extends Equatable {
  const SubsectionDto({
    required this.headers,
    required this.image,
    required this.linearGradient,
    required this.buttonText,
  });

  factory SubsectionDto.fromJson(Map<String, dynamic> json) => _$SubsectionDtoFromJson(json);
  final List<HeaderDto> headers;
  final String image;
  final LinearGradientDto? linearGradient;
  final String? buttonText;

  Map<String, dynamic> toJson() => _$SubsectionDtoToJson(this);

  @override
  List<Object?> get props => [headers, image, linearGradient, buttonText];
}
