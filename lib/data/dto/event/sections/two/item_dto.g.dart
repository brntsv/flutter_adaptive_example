// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
      title: json['title'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
    };
