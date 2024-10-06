import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_adaptive_example/data/dto/event/event_dto.dart';

/// Имитация бэкенда backend.json
///
/// Репозиторий для получения данных о событии
class EventRepository {
  Future<EventDto> getEvent() async {
    final jsonString = await rootBundle.loadString('lib/data/backend.json');
    final jsonMap = json.decode(jsonString);
    return EventDto.fromJson(jsonMap as Map<String, dynamic>);
  }
}
