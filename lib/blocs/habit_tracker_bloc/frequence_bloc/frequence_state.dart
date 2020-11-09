part of 'frequence_bloc.dart';

abstract class FrequenceState extends Equatable {
  const FrequenceState();

  @override
  List<Object> get props => [];
}

class FrequenceLoadedState extends FrequenceState {
  final List<Frequence> frequence;

  const FrequenceLoadedState([this.frequence]);

  @override
  List<Object> get props => [frequence];
}

class FrequenceErrorState extends FrequenceState {}
