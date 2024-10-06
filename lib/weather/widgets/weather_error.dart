import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'Something went wrong!',
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
