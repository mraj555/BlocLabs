import 'package:bloclabs/bloc_pattern_architecture/config/components/loading_widget.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
import 'package:bloclabs/bloc_pattern_architecture/services/storage/local_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                LocalStorage storage = LocalStorage();
                storage.clearValue('token').then((value) {
                  storage
                      .clearValue('isLogin')
                      .then((value) => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false));
                });
              },
              icon: Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: Center(child: Text("User logged in.")),
      ),
    );
  }
}
