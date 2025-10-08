import 'package:bloclabs/bloc_pattern_architecture/bloc/movie/movie_bloc.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/components/internet_exception.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/components/loading_widget.dart';
import 'package:bloclabs/bloc_pattern_architecture/config/routes/routes_name.dart';
import 'package:bloclabs/bloc_pattern_architecture/models/shows/shows.dart';
import 'package:bloclabs/bloc_pattern_architecture/services/storage/local_storage.dart';
import 'package:bloclabs/bloc_pattern_architecture/utils/enums.dart';
import 'package:bloclabs/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieBloc _bloc;

  @override
  void initState() {
    _bloc = MovieBloc(repo: getIt());
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
        body: BlocProvider<MovieBloc>(
          create: (context) => _bloc..add(MovieFetched()),
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              switch (state.movies.status) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.completed:
                  if (state.movies.data == null) {
                    return Center(child: Text("No Data Found"));
                  }
                  return ListView.builder(
                    itemCount: state.movies.data!.tv_shows.length,
                    itemBuilder: (context, index) {
                      final Shows movie = state.movies.data!.tv_shows[index];
                      return Card(
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: movie.image_thumbnail_path,
                            useOldImageOnUrlChange: true,
                            height: 50,
                            width: 50,
                            errorWidget: (context, url, error) => SizedBox(),
                            imageBuilder: (context, imageProvider) => Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          title: Text(movie.name),
                          subtitle: Text(movie.network),
                          trailing: Text(movie.status),
                        ),
                      );
                    },
                  );
                case Status.error:
                  if (state.movies.message == 'No Internet Connection.') {
                    return InternetException(onPressed: () => context.read<MovieBloc>().add(MovieFetched()));
                  }
                  return Center(child: Text(state.movies.message ?? ""));
                default:
                  return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
