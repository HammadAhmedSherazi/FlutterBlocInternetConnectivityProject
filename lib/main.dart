import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_bloc/bloc/internet_bloc.dart/internet_bloc.dart';
import 'package:internet_connectivity_bloc/screens/home_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => InternetBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      
      ),
      home: const HomeScreen(),
    );
  }
}
