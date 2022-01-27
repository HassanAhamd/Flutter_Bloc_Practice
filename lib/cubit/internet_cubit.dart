import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';



enum InternetState{Intial, Gained, Lost }

class InternetCubit extends Cubit<InternetState> {

  final _connectivity = Connectivity();
 late final StreamSubscription? _connectivityStream;
  InternetCubit() : super(InternetState.Intial){
    _connectivityStream = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetState.Gained);
      } else{
        emit(InternetState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    _connectivityStream?.cancel();
    return super.close();
  }

}
