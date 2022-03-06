# freezed_weather

A rewrite of [Bloc tutorial: Flutter Weather Tutorial](https://bloclibrary.dev/#/flutterweathertutorial)
using [freezed](https://pub.dev/packages/freezed).

- Bloc was used instead of Cubit
([Cubit vs Bloc](https://bloclibrary.dev/#/coreconcepts?id=cubit-vs-bloc))
  - Bloc provides better traceability of what's happening.
  - Bloc can be listened by / listen to other blocs
  - Bloc allows advanced event transformations
  - However, bloc requires more detailed implementation. `freezed` code generation could be used to reduce the amount of coding.
- `freezed` was used instead of `equatable` to compare data models
  - A `@freezed` class comes with auto-generated `copyWith` implementation, which is not prone to human-made errors (e.g., forget to add a variable into `prop` list, which is the mistake I've made).