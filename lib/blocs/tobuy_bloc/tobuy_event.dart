part of 'tobuy_bloc.dart';

abstract class TobuyEvent extends Equatable {
  const TobuyEvent();

  @override
  List<Object> get props => [];
}

class TobuyLoadedEvent extends TobuyEvent {}

class TobuyAddedEvent extends TobuyEvent {
  final TobuyListModel tobuyListModel;

  const TobuyAddedEvent(this.tobuyListModel);

  @override
  List<Object> get props => [tobuyListModel];
}

class TobuyUpdatedEvent extends TobuyEvent {
  final TobuyListModel tobuyListModel;

  const TobuyUpdatedEvent(this.tobuyListModel);

  @override
  List<Object> get props => [tobuyListModel];
}


class TobuyDeletedEvent extends TobuyEvent {
  final TobuyListModel tobuyListModel;

  const TobuyDeletedEvent(this.tobuyListModel);

  @override
  List<Object> get props => [tobuyListModel];
}
