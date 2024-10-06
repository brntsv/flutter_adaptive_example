import 'package:equatable/equatable.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/subsection_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_one_dto.g.dart';

@JsonSerializable()
class SectionOneDto extends Equatable {
  const SectionOneDto({required this.subsections});
  factory SectionOneDto.fromJson(Map<String, dynamic> json) => _$SectionOneDtoFromJson(json);
  final List<SubsectionDto> subsections;

  Map<String, dynamic> toJson() => _$SectionOneDtoToJson(this);

  @override
  List<Object?> get props => [subsections];
}
