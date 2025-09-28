import 'package:bloclabs/counter_app/bloc/counter_bloc.dart';
import 'package:bloclabs/counter_app/bloc/counter_event.dart';
import 'package:bloclabs/counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Counter App Demo"), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text("${state.counter}", style: TextStyle(fontSize: 60));
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                    label: Text("Increment"),
                    icon: Icon(Icons.add_circle_rounded),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                    label: Text("Decrement"),
                    icon: Icon(Icons.remove_circle_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
