import 'package:cats_app/bloc/home/home_bloc.dart';
import 'package:cats_app/bloc/home/home_states.dart';
import 'package:cats_app/bloc/home/home_events.dart';
import 'package:cats_app/ui/components/module_entry_button.dart';
import 'package:cats_app/utils/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:commons/commons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: context.read(),
      listener: _listener,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              _buildBackground(context),
              SafeArea(child: _buildBody()),
            ],
          )),
    );
  }

  void _listener(BuildContext context, HomeState state) {
    if (state is! HomeNavigation) return;

    final event = PushRequest(route: state.route);
    context.read<BaseRouterBloc>().add(event);
  }

  Widget _buildBackground(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.white],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildTitle(),
          Expanded(
            child: _buildModulesList(),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: const Text(
          "Modules",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildModulesList() {
    const modules = Module.values;

    return ListView.builder(
      itemCount: modules.length,
      itemBuilder: (context, index) {
        final module = modules[index];

        return ModuleEntryButton(
          module: module,
          onTap: (value) {
            final event = HomeModuleButtonTapped(module: value);
            context.read<HomeBloc>().add(event);
          },
        );
      },
    );
  }
}
