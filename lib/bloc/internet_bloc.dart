import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{

  final _connectivity = Connectivity();
  late final StreamSubscription? _connectivitySubscription;

  InternetBloc(): super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    on<InternetGainedEvent>((event, emit) => emit(InternetGainState()));

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      } else{
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
