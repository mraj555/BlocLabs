import 'package:bloclabs/authentication_app/ui/login_screen.dart';
import 'package:bloclabs/bloc_pattern_architecture/views/splash/splash_screen.dart';
import 'package:bloclabs/counter_app/ui/counter_screen.dart';
import 'package:bloclabs/equatable_demo/equatable_demo.dart';
import 'package:bloclabs/favourite_app/ui/favourite_app_screen.dart';
import 'package:bloclabs/filter_api_list_demo/ui/filter_posts_screen.dart';
import 'package:bloclabs/freezed_package_demo/ui/freezed_package_demo.dart';
import 'package:bloclabs/get_api_demo/ui/posts_screen.dart';
import 'package:bloclabs/image_picker_demo/ui/image_picker_screen.dart';
import 'package:bloclabs/slider_and_switch_demo/ui/slider_and_switch_screen.dart';
import 'package:bloclabs/todo_app/ui/todo_screen.dart';
import 'package:flutter/material.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Topics"), centerTitle: true),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Equatable Demo Screen
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EquatableDemoScreen())),
                  child: Text("Equatable Demo"),
                ),
                SizedBox(height: 15),

                ///Counter App
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CounterScreen())),
                  child: Text("Counter App"),
                ),
                SizedBox(height: 15),

                ///Slider and Switch Demo
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SliderAndSwitchScreen())),
                  child: Text("Slider and Switch Demo"),
                ),
                SizedBox(height: 15),

                ///Image Picker Package Demo
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerScreen())),
                  child: Text("Image Picker Package Demo"),
                ),
                SizedBox(height: 15),

                ///ToDo App
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TodoScreen())),
                  child: Text("ToDo App"),
                ),
                SizedBox(height: 15),

                ///Favourite App
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteAppScreen())),
                  child: Text("Favourite App"),
                ),
                SizedBox(height: 15),

                ///Get API Demo
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostsScreen())),
                  child: Text("Get API Demo"),
                ),
                SizedBox(height: 15),

                ///Filter API Demo
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPostsScreen())),
                  child: Text("Filter API Demo"),
                ),
                SizedBox(height: 15),

                ///Authentication Demo
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                  child: Text("Authentication Demo"),
                ),
                SizedBox(height: 15),

                ///Freezed Package Demo
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FreezedPackageDemo())),
                  child: Text("Freezed Package Demo"),
                ),
                SizedBox(height: 15),

                ///Bloc Pattern Architecture
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen())),
                  child: Text("Bloc Pattern Architecture"),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
