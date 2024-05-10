import 'package:cats/src/bloc/cats/cats_list_bloc.dart';
import 'package:cats/src/bloc/router/cats_route_generator.dart';
import 'package:cats/src/bloc/router/cats_router_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cats/src/ui/screens/cats_list_screen.dart';

import 'package:commons_ui/commons_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCatsScreen extends StatelessWidget {
  const MainCatsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatsRouterBloc()),
        BlocProvider(create: (_) => CatsListsBloc()),
      ],
      child: GenericMainScreen<CatsRouterBloc>(
        initialScreen: const CatsListScreen(),
        routeGenerator: CatsRouteGenerator.name,
      ),
    );
  }
}
