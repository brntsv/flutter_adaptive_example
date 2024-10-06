import 'package:equatable/equatable.dart';
import 'package:flutter_adaptive_example/data/dto/event/sections/two/item_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_two_dto.g.dart';

@JsonSerializable()
class SectionTwoDto extends Equatable {
  const SectionTwoDto({required this.title, required this.items});
  factory SectionTwoDto.fromJson(Map<String, dynamic> json) => _$SectionTwoDtoFromJson(json);
  final String title;
  final List<ItemDto> items;

  Map<String, dynamic> toJson() => _$SectionTwoDtoToJson(this);

  @override
  List<Object?> get props => [title, items];
}
