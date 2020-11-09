part of 'frequence_bloc.dart';

abstract class FrequenceEvent extends Equatable {
  const FrequenceEvent();

  @override
  List<Object> get props => [];
}

class FrequenceLoadedEvent extends FrequenceEvent {}

class FrequenceAddedEvent extends FrequenceEvent {
  final Frequence frequenceList;

  const FrequenceAddedEvent(this.frequenceList);

  @override
  List<Object> get props => [frequenceList];
}
