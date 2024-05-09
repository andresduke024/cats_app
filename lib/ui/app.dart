import 'package:cats_app/bloc/home/home_bloc.dart';
import 'package:cats_app/bloc/router/base_route_generator.dart';
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
        onGenerateRoute: (settings) {
          return BaseRouteGenerator().generateRoute(settings);
        },
        home: BaseRootScreen(
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
