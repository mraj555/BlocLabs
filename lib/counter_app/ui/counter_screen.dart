import 'package:bloclabs/counter_app/bloc/counter_bloc.dart';
import 'package:bloclabs/counter_app/bloc/counter_event.dart';
import 'package:bloclabs/counter_app/bloc/counter_state.dart';
import 'package:bloclabs/filter_api_list_demo/ui/filter_posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _bloc;

  @override
  void initState() {
    _bloc = CounterBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<CounterBloc>(
        create: (context) => _bloc,
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
                    BlocBuilder<CounterBloc, CounterState>(
                      buildWhen: (previous, current) => false,
                      builder: (context, state) {
                        return ElevatedButton.icon(
                          onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                          label: Text("Increment"),
                          icon: Icon(Icons.add_circle_rounded),
                        );
                      },
                    ),
                    SizedBox(width: 20),
                    BlocBuilder<CounterBloc, CounterState>(
                      buildWhen: (previous, current) => false,
                      builder: (context, state) {
                        return ElevatedButton.icon(
                          onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                          label: Text("Decrement"),
                          icon: Icon(Icons.remove_circle_rounded),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPostsScreen())),
                  label: Text("Next"),
                  icon: Icon(Icons.navigate_next),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
