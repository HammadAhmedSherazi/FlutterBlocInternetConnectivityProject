import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_bloc/bloc/internet_bloc.dart/internet_event.dart';
import 'package:internet_connectivity_bloc/bloc/internet_bloc.dart/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class InternetBloc extends Bloc<InternetEvent, InternetState  >{

      Connectivity connectivity = Connectivity();
      StreamSubscription ? connectivitySubscription;

      InternetBloc() : super(InternetIntialState()){
        on<InternetLostEvent>((event, emit) => InternetLostState());
        on<InternetGainedEvent>((event, emit) => InternetGainedState());


      connectivitySubscription =  connectivity.onConnectivityChanged.listen((event) { 
          if(event == ConnectivityResult.wifi || event == ConnectivityResult.mobile){
            add(InternetGainedEvent());
          }
          else{
            add(InternetLostEvent());
          }
        });

      }

      @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }

      
}
