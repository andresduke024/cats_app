import 'package:cats/cats.dart';
import 'package:cats_app/bloc/home/home_bloc.dart';
import 'package:cats_app/ui/screens/base_error_screen.dart';
import 'package:cats_app/ui/screens/home_screen.dart';
import 'package:commons/commons.dart';
import 'package:cats_app/bloc/router/base_router_block.dart';
import 'package:cats_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash/splash_bloc.dart';
import 'screens/base_root_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

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
        routes: _getRoutes(),
        home: BaseRootScreen(
          child: const SplashScreen(),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _getRoutes() {
    onRootActionRequested(BuildContext context, ExternalNavigationRequest request) {
      final router = context.read<BaseRouterBloc>();

      switch (request) {
        case ExternalPushNavigationRequest(route: final route, arguments: final arguments):
          router.add(SimplePushRequest(route: route, arguments: arguments));
        case ExternalPopNavigationRequest(route: final route):
          router.add(SimplePopRequest(route: route));
      }
    }

    return {
      CommonRoutes.home.value: (context) => const HomeScreen(),
      CommonRoutes.catsPackage.value: (context) => MainCatsScreen((request) => onRootActionRequested(context, request)),
      CommonRoutes.favoriteCatsPackages.value: (context) => const BaseErrorScreen(),
    };
  }
}
