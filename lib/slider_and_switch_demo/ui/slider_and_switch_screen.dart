import 'package:flutter/material.dart';

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
                  Switch(value: true, onChanged: (value) {}),
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
