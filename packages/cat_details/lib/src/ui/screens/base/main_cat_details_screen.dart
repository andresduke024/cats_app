import 'package:cat_details/src/ui/screens/cat_details_screen.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/router/cat_details_route_generator.dart';
import '../../../bloc/router/cat_details_router_bloc.dart';

class MainCatDetailsScreen extends StatelessWidget {
  final Cat data;

  const MainCatDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatDetailsRouterBloc()),
      ],
      child: GenericMainScreen<CatDetailsRouterBloc>(
        initialScreen: CatDetailsScreen(cat: data),
        routeGenerator: CatDetailsRouteGenerator.name,
      ),
    );
  }
}
