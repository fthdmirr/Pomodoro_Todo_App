import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_habifa_v2/model/tobuy_models.dart';
import 'package:flutter_habifa_v2/repository/tobuy_repo.dart';

part 'tobuy_event.dart';
part 'tobuy_state.dart';

class TobuyBloc extends Bloc<TobuyEvent, TobuyState> {
  final TobuyRepository tobuyRepository;
  TobuyBloc({@required this.tobuyRepository}) : super(TobuyLoadedState());

  @override
  Stream<TobuyState> mapEventToState(
    TobuyEvent event,
  ) async* {
    if (event is TobuyLoadedEvent) {
      yield* _mapTobuyLoadedToState();
    }
    if (event is TobuyAddedEvent) {
      yield* _mapTobuyAddedToState(event);
    }
    if (event is TobuyUpdatedEvent) {
      yield* _mapTobuyUpdatedToState(event);
    }
    if (event is TobuyDeletedEvent) {
      yield* _mapToBuyDeleteToState(event);
    }
  }

  Stream<TobuyState> _mapTobuyLoadedToState() async* {
    try {
      final List<TobuyListModel> tobuyList =
          await this.tobuyRepository.getAllTobuys();
      print("getirilen:" + tobuyList.toList().toString());
      yield TobuyLoadedState(tobuyList);
    } catch (e) {
      print("fetchError:" + e.toString());
      yield TobuyErrorState();
    }
  }

  Stream<TobuyState> _mapTobuyAddedToState(TobuyAddedEvent event) async* {
    try {
      if (state is TobuyLoadedState) {
        await this.tobuyRepository.insertTobuy(event.tobuyListModel);
      
        final List<TobuyListModel> tobuyList =
            await this.tobuyRepository.getAllTobuys();
        yield TobuyLoadedState(tobuyList);
      }
    } catch (e) {
      print("addedError:" + e.toString());
      yield TobuyErrorState();
    }
  }

  Stream<TobuyState> _mapTobuyUpdatedToState(TobuyUpdatedEvent event) async* {
    try {
      if (state is TobuyLoadedState) {
        await tobuyRepository.updateTobuy(event.tobuyListModel);
        final List<TobuyListModel> tobuyList =
            await this.tobuyRepository.getAllTobuys();

        yield TobuyLoadedState(tobuyList);
      }
    } catch (e) {
      print("updateError: " + e.toString());
      yield TobuyErrorState();
    }
  }

  Stream<TobuyState> _mapToBuyDeleteToState(TobuyDeletedEvent event) async* {
    try {
      if (state is TobuyLoadedState) {
        await tobuyRepository.deleteTobuy(event.tobuyListModel.tobuyID);
        yield TobuyLoadedState();
      }
    } catch (e) {
      print(e.toString());
      yield TobuyErrorState();
    }
  }
}
