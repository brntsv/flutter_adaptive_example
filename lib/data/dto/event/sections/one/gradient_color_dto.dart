import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gradient_color_dto.g.dart';

@JsonSerializable()
class GradientColorDto extends Equatable {
  const GradientColorDto({
    required this.color,
    required this.opacity,
    required this.stop,
  });

  factory GradientColorDto.fromJson(Map<String, dynamic> json) => _$GradientColorDtoFromJson(json);

  final String color;
  final int opacity;
  final int stop;

  Map<String, dynamic> toJson() => _$GradientColorDtoToJson(this);

  @override
  List<Object?> get props => [color, opacity, stop];
}
