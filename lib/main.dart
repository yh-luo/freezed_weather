import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_repository/weather_repository.dart';

import 'app.dart';
import '../weather_bloc_observer.dart';

void main() async {
  HydratedBlocOverrides.runZoned(
    () => runApp(WeatherApp(weatherRepository: WeatherRepository.instance())),
    blocObserver: WeatherBlocObserver(),
    createStorage: () async {
      WidgetsFlutterBinding.ensureInitialized();
      return HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory(),
      );
    },
  );
}
