import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_habifa_v2/model/frequence_models.dart';
import 'package:flutter_habifa_v2/repository/frequence_repo.dart';

part 'frequence_event.dart';
part 'frequence_state.dart';

class FrequenceBloc extends Bloc<FrequenceEvent, FrequenceState> {
  final FrequenceRepository frequenceRepository;
  FrequenceBloc({@required this.frequenceRepository})
      : super(FrequenceLoadedState());

  @override
  Stream<FrequenceState> mapEventToState(
    FrequenceEvent event,
  ) async* {
    if (event is FrequenceLoadedEvent) {
      yield* _mapFrequenceLoadedToState();
    }
    if (event is FrequenceAddedEvent) {
      yield* _mapFrequenceAddedToState(event);
    }
  }

  Stream<FrequenceState> _mapFrequenceLoadedToState() async* {
    try {
      if (state is FrequenceLoadedState) {
        final List<Frequence> frequenceList =
            await this.frequenceRepository.getAllFrequences();
        yield FrequenceLoadedState(frequenceList);
      }
    } catch (e) {
      print('FrequenceFetchError: ' + e.toString());
      yield FrequenceErrorState();
    }
  }

  Stream<FrequenceState> _mapFrequenceAddedToState(
      FrequenceAddedEvent event) async* {
    if (state is FrequenceLoadedState) {
      try {
        await this.frequenceRepository.insertFrequence(event.frequenceList);
        final List<Frequence> frequenceList =
            await this.frequenceRepository.getAllFrequences();
        yield FrequenceLoadedState(frequenceList);
      } catch (e) {
        print("FrequenceAddedError: " + e.toString());
        yield FrequenceErrorState();
      }
    }
  }
}
