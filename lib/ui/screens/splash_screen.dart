import 'package:cats_app/utils/base_resources.dart';
import 'package:commons/commons.dart';
import 'package:cats_app/bloc/splash/splash_bloc.dart';
import 'package:cats_app/bloc/splash/splash_states.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modular_router/modular_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: context.read(),
      listener: _listener,
      child: _buildBody(context),
    );
  }

  void _listener(BuildContext context, SplashState state) {
    if (state.status != SplashStatus.success) return;

    final action = RouterPushAndRemoveUntilActionType(removeUntilRoute: CommonRoutes.root);
    final event = PushRequest(route: CommonRoutes.home.value, actionType: action);
    context.read<BaseRouterBloc>().add(event);
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: PaddingImage(
          assetName: BaseResources.splash.value,
          padding: const EdgeInsets.all(50),
        ),
      ),
    );
  }
}
