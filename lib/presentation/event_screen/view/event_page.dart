import 'package:flutter/material.dart';
import 'package:flutter_adaptive_example/data/dto/event/event_dto.dart';
import 'package:flutter_adaptive_example/data/repositories/event_repository.dart';
import 'package:flutter_adaptive_example/presentation/event_screen/cubit/event_cubit.dart';
import 'package:flutter_adaptive_example/presentation/event_screen/view/widgets/section_one_widget.dart';
import 'package:flutter_adaptive_example/presentation/event_screen/view/widgets/section_two_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit(EventRepository())..loadEvent(),
      child: BlocBuilder<EventCubit, EventDto?>(
        builder: (context, event) {
          if (event == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return EventView(event: event);
        },
      ),
    );
  }
}

class EventView extends StatelessWidget {
  const EventView({required this.event, super.key});
  final EventDto event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SectionOneWidget(sectionOne: event.sectionOne),
          SectionTwoWidget(sectionTwo: event.sectionTwo),
        ],
      ),
    );
  }
}
