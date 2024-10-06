import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'header_dto.g.dart';

@JsonSerializable()
class HeaderDto extends Equatable {
  const HeaderDto({required this.title, required this.description});

  factory HeaderDto.fromJson(Map<String, dynamic> json) => _$HeaderDtoFromJson(json);
  final String title;
  final String? description;

  Map<String, dynamic> toJson() => _$HeaderDtoToJson(this);

  @override
  List<Object?> get props => [title, description];
}
