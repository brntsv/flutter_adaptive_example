import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_dto.g.dart';

@JsonSerializable()
class ItemDto extends Equatable {
  const ItemDto({required this.title, required this.image, required this.price});

  factory ItemDto.fromJson(Map<String, dynamic> json) => _$ItemDtoFromJson(json);
  final String title;
  final String image;
  final int price;

  Map<String, dynamic> toJson() => _$ItemDtoToJson(this);

  @override
  List<Object?> get props => [title, image, price];
}
