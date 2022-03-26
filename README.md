# freezed_weather

A rewrite of [Bloc tutorial: Flutter Weather Tutorial](https://bloclibrary.dev/#/flutterweathertutorial)
using [freezed](https://pub.dev/packages/freezed).

- Bloc was used instead of Cubit
([Cubit vs Bloc](https://bloclibrary.dev/#/coreconcepts?id=cubit-vs-bloc))
  - Bloc provides better traceability of what's happening.
    - `onTransition` shows the event that triggers the new state
  - Bloc allows advanced event transformations
  - However, bloc requires more detailed implementation. `freezed` code generation could be used to reduce the amount of coding.
- `freezed` was used instead of `equatable` to compare data models
  - A `@freezed` class comes with auto-generated `copyWith` implementation, which is not prone to human-made errors (e.g., forget to add a variable into `prop` list, which is the mistake I've made).

### Notable changes from the original

#### `@freezed` data models

- `copyWith`, `==` and `toString` implementation

- Properties can be `null`

  Previously, `Weather.empty` is provided in initial `WeatherState` because [equatable](https://pub.dev/packages/equatable) does not allow `null` in `props`. [freezed](https://pub.dev/packages/freezed) handles `null` properly so we can just use `null` as `weather` in the state when `weather` is not available yet (e.g., in the initial state). Both work fine, it's only a matter of choice so `empty` is kept in `lib/weather/models/weather.dart`.

#### `@freezed` event & state for bloc

#### Persist only the loaded state

In the original tutorial, all states are cached. Imagine the scenario: When an error happens, the user terminates the app and reopens it. Guess what? The error state is served immediately!

The bloc is working properly but the user experience is not optimal. `WeatherBloc.toJson` is modified to only cache the successfully loaded state. When the user opens the app, it always shows that last loaded weather (or the initial state if nothing happens yet). Again, it's a matter of choice of when to cache the states.