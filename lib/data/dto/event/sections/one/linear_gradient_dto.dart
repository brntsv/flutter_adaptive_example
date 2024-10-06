import 'package:equatable/equatable.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/gradient_color_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'linear_gradient_dto.g.dart';

@JsonSerializable()
class LinearGradientDto extends Equatable {
  const LinearGradientDto({required this.start, required this.end});

  factory LinearGradientDto.fromJson(Map<String, dynamic> json) =>
      _$LinearGradientDtoFromJson(json);
  final GradientColorDto start;
  final GradientColorDto end;

  Map<String, dynamic> toJson() => _$LinearGradientDtoToJson(this);

  @override
  List<Object?> get props => [start, end];
}
