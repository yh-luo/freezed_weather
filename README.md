# freezed_weather

A rewrite of [Bloc tutorial: Flutter Weather Tutorial](https://bloclibrary.dev/#/flutterweathertutorial)
using [freezed](https://pub.dev/packages/freezed).

- Bloc is used instead of Cubit
([Cubit vs Bloc](https://bloclibrary.dev/#/coreconcepts?id=cubit-vs-bloc))
  - Bloc provides better traceability of what's happening.
    - `onTransition` shows the event that triggers the new state
  - Bloc allows advanced event transformations
  - However, bloc requires more detailed implementation. `freezed` code generation could be used to reduce the amount of coding.
- [freezed](https://pub.dev/packages/freezed) is used to compare data models. [equatable](https://pub.dev/packages/equatable) is not used anymore.
  - A `@freezed` class comes with generated `copyWith` implementation, which is not prone to human-made errors (e.g., forget to add a variable into `prop` list, which is the mistake I've made).
- Use [wttr.in](https://github.com/chubin/wttr.in) as the remote data provider.
  - [MetaWeather API](http://www.metaweather.com/) is not available since May 2022.
  - Current workaround
    - A new package `wttr_in_api`, which implements a client for `wttr.in`, is created.
    - `WeatherRepository` is an abstract class now.
    - The previous `WeatherRepository` becomes `MetaWeatherWeatherRepository`.
    - A new `WttrInWeatherRepository` is created to use `wttr_in_api`.
    - `WeatherRepository` needs to be instantiated through `WeatherRepository.instance()` now.

### Notable changes

#### `@freezed` data models

- `copyWith`, `==` and `toString` implementation

- Properties can be `null`

  Previously, `Weather.empty` is provided in initial `WeatherState` because [equatable](https://pub.dev/packages/equatable) does not allow `null` in `props`. [freezed](https://pub.dev/packages/freezed) handles `null` properly so we can just use `null` as `weather` in the state when `weather` is not available yet (e.g., in the initial state). Both work fine, it's only a matter of choice so `empty` is kept in `lib/weather/models/weather.dart`.

#### `@freezed` event & state for bloc

#### Persist only the loaded state

In the original tutorial, all states are cached. Imagine the scenario: When an error happens, the user terminates the app and reopens it. Guess what? The error state is served immediately!

The bloc is working properly but the user experience is not optimal. `WeatherBloc.toJson` is modified to only cache the successfully loaded state. When the user opens the app, it always shows that last loaded weather (or the initial state if nothing happens yet). Again, it's a matter of choice of when to cache the states.

### Changelog

#### After MetaWeather is down

A new package `wttr_in_api`, which implements a client for [wttr.in](https://github.com/chubin/wttr.in), is created. The layered structure makes it possible to switch between different API providers.
`WeatherRepository` is refactored to an abstract class to reflect this.

You can use tag `2.0` to fetch the previous project, which uses only the MetaWeather API.

#### After Flutter 3.0

This tutorial has been rewritten after the releases of [Flutter 3.0](https://docs.flutter.dev/development/tools/sdk/release-notes), [freezed 2.0.3](https://pub.dev/packages/freezed), and [hydrated_bloc 9.0.0-dev.2](https://pub.dev/packages/hydrated_bloc/versions/9.0.0-dev.2).

It won't work on previous versions. You can use tag `1.0` to fetch the older scripts.
