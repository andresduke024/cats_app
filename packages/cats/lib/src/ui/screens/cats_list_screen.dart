import 'package:cats/src/bloc/cats/cats_list_bloc.dart';
import 'package:cats/src/bloc/cats/cats_list_states.dart';
import 'package:cats/src/bloc/router/cats_router_bloc.dart';
import 'package:cats/src/ui/components/cat_list_tile.dart';
import 'package:cats/src/ui/components/cats_scaffold.dart';
import 'package:cats/src/utils/cats_package_routes.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cat.dart';

class CatsListScreen extends StatelessWidget {
  const CatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CatsListsBloc>(context),
      child: CatsScaffold(
        onBackPressed: () {
          final event = AppRootPopRequest();
          context.read<CatsRouterBloc>().add(event);
        },
        body: SafeArea(
          child: BlocBuilder<CatsListsBloc, CatsListState>(
            buildWhen: _buildWhen,
            builder: _builder,
          ),
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
        return _buildForLoadingState(context);
      case CatsListStatus.success:
        return _buildForLoadedState(context, state.data);
      case CatsListStatus.failure:
        return const Text("Error");
    }
  }

  Widget _buildForLoadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildForLoadedState(BuildContext context, List<Cat> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (builderContext, index) {
        return CatListTile(
          onTap: (cat) {
            final event = SimplePushRequest(
              route: CatsPackageRoutes.detailScreen.value,
              arguments: cat,
            );
            context.read<CatsRouterBloc>().add(event);
          },
          data: data[index],
        );
      },
    );
  }
}
