import 'dart:convert';

import 'package:cat_details/cat_details.dart';
import 'package:cats/cats.dart';
import 'package:cats_favorites/cats_favorites.dart';

import 'package:commons/commons.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainDependenciesBuilder {
  MainDependenciesBuilder();

  start() async {
    final injector = GetIt.I;

    final String confidentContent = await rootBundle.loadString("assets/config/main.json");

    Map configData = jsonDecode(confidentContent);

    EnvironmentValues environment = EnvironmentValues(data: configData);
    injector.registerSingleton<EnvironmentValuesProvider>(EnvironmentValuesProviderImpl(environment: environment));

    await Hive.initFlutter();

    Iterable<BasePackageBuilder> builders = [
      CatsPackageBuilder(),
      CatDetailsPackageBuilder(),
      CatsFavoritesPackageBuilder(),
    ];

    await Future.forEach(builders, (element) async {
      await element.setUp();
    });
  }
}
