import 'package:cats/src/bloc/cats/cats_list_bloc.dart';
import 'package:cats/src/bloc/cats/cats_list_states.dart';
import 'package:cats/src/bloc/router/cats_router_bloc.dart';
import 'package:cats/src/ui/components/cat_list_tile.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';

class CatsListScreen extends StatelessWidget {
  const CatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CatsListsBloc>(context),
      child: GenericScaffold<CatsRouterBloc>(
        origin: NavigationPoint.root,
        title: Constants.navigationHeaderName,
        body: BlocBuilder<CatsListsBloc, CatsListState>(
          buildWhen: _buildWhen,
          builder: _builder,
        ),
      ),
    );
  }

  bool _buildWhen(CatsListState prevState, CatsListState nextState) {
    return nextState.status != CatsListStatus.initial;
  }

  Widget _builder(BuildContext context, CatsListState state) {
    switch (state.status) {
      case CatsListStatus.initial:
        return const SizedBox();
      case CatsListStatus.loading:
        return const GenericLoading();
      case CatsListStatus.success:
        return _buildForLoadedState(context, state.data);
      case CatsListStatus.failure:
        return const GenericErrorScreen<CatsRouterBloc>(
          navigationPoint: NavigationPoint.root,
        );
    }
  }

  Widget _buildForLoadedState(BuildContext context, List<Cat> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (builderContext, index) {
        return CatListTile(
          onTap: (cat) {
            final event = AppRootPushRequest(
              route: CommonRoutes.catDetailsPackage.value,
              arguments: cat.copyWith(),
            );
            context.read<CatsRouterBloc>().add(event);
          },
          data: data[index],
        );
      },
    );
  }
}
