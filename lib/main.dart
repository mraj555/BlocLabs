import 'package:bloclabs/counter_app/ui/counter_screen.dart';
import 'package:bloclabs/equatable_demo/equatable_demo.dart';
import 'package:bloclabs/slider_and_switch_demo/ui/slider_and_switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_app/bloc/counter_bloc.dart';
import 'slider_and_switch_demo/bloc/switch/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // //Bloc Provider use for Single Bloc Instance
    // return BlocProvider(
    //   create: (context) => CounterBloc(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
    //     home: CounterScreen(),
    //   ),
    // );

    //if Multi bloc then we can use nested BlocProvider like this
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocProvider(
        create: (context) => SwitchBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
          home: SliderAndSwitchScreen(),
        ),
      ),
    );
  }
}
