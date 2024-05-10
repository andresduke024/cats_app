import 'package:cats_app/bloc/home/home_bloc.dart';
import 'package:cats_app/bloc/router/base_route_generator.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash/splash_bloc.dart';

class App extends StatelessWidget {
  final ExtendedRouteGenerator routeGenerator;

  const App({
    super.key,
    this.routeGenerator = const BaseRouteGenerator(),
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BaseRouterBloc()),
        BlocProvider(create: (_) => SplashBloc()),
        BlocProvider(create: (_) => HomeBloc()),
      ],
      child: MaterialApp(
        title: 'Cats app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: routeGenerator.generateRoute,
        onGenerateInitialRoutes: routeGenerator.generateInitialRoute,
      ),
    );
  }
}
