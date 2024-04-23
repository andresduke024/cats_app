import 'dart:convert';

import 'package:cats/cats.dart';
import 'package:commons/commons.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class MainDependenciesBuilder {
  final GetIt _injector = GetIt.instance;

  MainDependenciesBuilder();

  start() async {
    final String confidentContent = await rootBundle.loadString("assets/config/main.json");

    Map configData = jsonDecode(confidentContent);

    EnvironmentValues environment = EnvironmentValues(data: configData);
    _injector.registerSingleton<EnvironmentValuesProvider>(EnvironmentValuesProviderImpl(environment: environment));

    Iterable<BasePackageBuilder> builders = [
      CatsPackageBuilder(),
    ];

    await Future.forEach(builders, (element) async {
      await element.setUp(globalInjector: _injector);
    });
  }
}
