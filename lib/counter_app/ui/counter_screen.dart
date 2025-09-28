import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Counter App Demo"), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("0", style: TextStyle(fontSize: 60)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(onPressed: () {}, label: Text("Increment"), icon: Icon(Icons.add_circle_rounded)),
                  ElevatedButton.icon(onPressed: () {}, label: Text("Decrement"), icon: Icon(Icons.remove_circle_rounded)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
