import 'package:cats_favorites/src/bloc/cats_favorites/cats_favorites_events.dart';
import 'package:cats_favorites/src/bloc/cats_favorites/cats_favorites_states.dart';
import 'package:cats_favorites/src/bloc/router/cat_favorites_router_bloc.dart';
import 'package:cats_favorites/src/ui/components/favorite_card.dart';
import 'package:cats_favorites/src/utils/constants.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cats_favorites/cats_favorites_bloc.dart';

class CatsFavoritesScreen extends StatelessWidget {
  const CatsFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CatsFavoritesBloc>(context),
      child: BlocListener<CatsFavoritesBloc, CatsFavoritesState>(
        listener: _listener,
        child: GenericScaffold<CatFavoritesRouterBloc>(
          routerActionHandlerTypeOnBack: RouterActionHandlerType.external,
          title: Constants.navigationHeaderName,
          body: BlocBuilder<CatsFavoritesBloc, CatsFavoritesState>(
            builder: _builder,
            buildWhen: _buildWhen,
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, CatsFavoritesState state) {
    if (state is! CatsFavoritesNavigationState) {
      return;
    }

    onGoBack() {
      const event = LoadCatsFavorites();
      context.read<CatsFavoritesBloc>().add(event);
    }

    final event = PushRequest(route: state.route, arguments: state.arguments, onGoBack: onGoBack);
    context.read<CatFavoritesRouterBloc>().add(event);
  }

  bool _buildWhen(CatsFavoritesState previousState, CatsFavoritesState nextState) {
    return nextState is! CatsFavoritesNavigationState;
  }

  Widget _builder(BuildContext context, CatsFavoritesState state) {
    switch (state) {
      case CatsFavoritesInitialState():
        return const SizedBox();
      case CatsFavoritesLoadingState():
        return const GenericLoading();
      case CatsFavoritesLoadedState(data: final data) || CatsFavoritesNavigationState(data: final data):
        return _buildForSuccessStatus(context, data ?? []);
      case CatsFavoritesFailureState():
        return const GenericErrorScreen<CatFavoritesRouterBloc>(
          routerActionHandlerType: RouterActionHandlerType.external,
        );
    }
  }

  Widget _buildForSuccessStatus(BuildContext context, List<Cat> data) {
    const double spacing = 10;

    return GridView.count(
      padding: const EdgeInsets.all(spacing),
      crossAxisCount: 2,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      children: data.map((e) {
        return FavoriteCard(data: e);
      }).toList(),
    );
  }
}
