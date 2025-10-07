import 'package:bloclabs/bloc_pattern_architecture/config/routes/app_routes.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
import 'package:bloclabs/bloc_pattern_architecture/views/splash/splash_screen.dart';
import 'package:bloclabs/favourite_app/bloc/favourite_bloc.dart';
import 'package:bloclabs/favourite_app/repository/favourite_repository.dart';
import 'package:bloclabs/filter_api_list_demo/bloc/filter_posts_bloc.dart';
import 'package:bloclabs/freezed_package_demo/ui/freezed_package_demo.dart';
import 'package:bloclabs/get_api_demo/bloc/posts_bloc.dart';
import 'package:bloclabs/image_picker_demo/bloc/image_picker_bloc.dart';
import 'package:bloclabs/image_picker_demo/utils/image_picker_utils.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/slider/slider_bloc.dart';
import 'package:bloclabs/todo_app/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    // //if Multi bloc then we can use nested BlocProvider like this
    // return BlocProvider(
    //   create: (context) => CounterBloc(),
    //   child: BlocProvider(
    //     create: (context) => SwitchBloc(),
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
    //       home: SliderAndSwitchScreen(),
    //     ),
    //   ),
    // );

    //MultiBlocProvider use for Multiple Blocs Classes
    return MultiBlocProvider(
      providers: [
        BlocProvider<SwitchBloc>(create: (context) => SwitchBloc()),
        BlocProvider<SliderBloc>(create: (context) => SliderBloc()),
        BlocProvider<ImagePickerBloc>(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider<ToDoBloc>(create: (context) => ToDoBloc()),
        BlocProvider<FavouriteBloc>(create: (context) => FavouriteBloc(FavouriteRepository())),
        BlocProvider<PostsBloc>(create: (context) => PostsBloc()),
        BlocProvider<FilterPostsBloc>(create: (context) => FilterPostsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
        // home: SplashScreen(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
