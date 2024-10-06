import 'package:equatable/equatable.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/one/section_one_dto.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/two/section_two_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.g.dart';

@JsonSerializable()
class EventDto extends Equatable {
  const EventDto({required this.sectionOne, required this.sectionTwo});

  factory EventDto.fromJson(Map<String, dynamic> json) => _$EventDtoFromJson(json);
  final SectionOneDto sectionOne;
  final SectionTwoDto sectionTwo;

  Map<String, dynamic> toJson() => _$EventDtoToJson(this);

  @override
  List<Object?> get props => [sectionOne, sectionTwo];
}
