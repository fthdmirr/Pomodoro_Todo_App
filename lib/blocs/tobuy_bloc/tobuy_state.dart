part of 'tobuy_bloc.dart';

abstract class TobuyState extends Equatable {
  const TobuyState();

  @override
  List<Object> get props => [];
}

class TobuyLoadedState extends TobuyState {
  final List<TobuyListModel> tobuyList;
  const TobuyLoadedState([this.tobuyList = const []]); //?
  @override
  List<Object> get props => [tobuyList];
}

class TobuyErrorState extends TobuyState {
  
}
