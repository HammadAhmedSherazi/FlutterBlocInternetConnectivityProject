import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_bloc/bloc/internet_bloc.dart/internet_bloc.dart';
import 'package:internet_connectivity_bloc/bloc/internet_bloc.dart/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if(state is InternetGainedState) {
              return const Text('Connected!');
            } else if(state is InternetLostState){
              return const Text('Internet is disconnected!');
            }
            else{
              return const Text('Loading...');
            }
    
          },
        ),
      )),
    );
  }
}


  displayText(InternetState state) {
  switch (state) {
    // ignore: constant_pattern_never_matches_value_type
    case InternetGainedState:
      return const Text('Connected!');
    
    // ignore: constant_pattern_never_matches_value_type
    case InternetLostState:
      return const Text('Internet is disconnected!');

    default:
      return const Text('Loading...');

      
    
  }
}
