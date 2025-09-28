import 'package:bloclabs/counter_app/ui/counter_screen.dart';
import 'package:bloclabs/equatable_demo/equatable_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_app/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Bloc Provider use for Single Bloc Instance
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        home: CounterScreen(),
      ),
    );
  }
}
