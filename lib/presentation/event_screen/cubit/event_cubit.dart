import 'package:flutter_adaptive_example/data/dto/event/event_dto.dart';
import 'package:flutter_adaptive_example/data/repositories/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCubit extends Cubit<EventDto?> {
  EventCubit(this._repository) : super(null);
  final EventRepository _repository;

  Future<void> loadEvent() async {
    try {
      final event = await _repository.getEvent();
      emit(event);
    } catch (e) {
      // Обработка ошибок
      emit(null);
    }
  }
}
