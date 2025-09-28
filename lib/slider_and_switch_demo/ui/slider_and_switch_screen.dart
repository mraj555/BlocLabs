import 'package:bloclabs/slider_and_switch_demo/bloc/switch/switch_bloc.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/switch/switch_event.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderAndSwitchScreen extends StatelessWidget {
  const SliderAndSwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Slider and Switch Demo"), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications"),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return Switch(
                        value: state.isNotification,
                        onChanged: (value) => context.read<SwitchBloc>().add(EnableOrDisableNotification()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(height: 200, color: Colors.red.withValues(alpha: .2)),
              SizedBox(height: 50),
              Slider(value: .4, onChanged: (value) {}),
            ],
          ),
        ),
      ),
    );
  }
}
