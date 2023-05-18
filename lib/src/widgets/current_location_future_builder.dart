import 'package:flutter/material.dart';
import 'package:http_sth/src/repository/current_location_repository.dart';
import 'package:provider/provider.dart';

class CurrentLocationFutureBuilder extends StatefulWidget {
  const CurrentLocationFutureBuilder({super.key});

  @override
  State<CurrentLocationFutureBuilder> createState() =>
      _CurrentLocationFutureBuilderState();
}

class _CurrentLocationFutureBuilderState
    extends State<CurrentLocationFutureBuilder> {
  @override
  void didUpdateWidget(CurrentLocationFutureBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Provider.of<LocationRepository>(context).connectionState,
        builder: (context, connectionState, child) {
          return connectionState == ConnectionState.waiting
              ? const CircularProgressIndicator()
              : FutureBuilder(
                  future:
                      Provider.of<LocationRepository>(context).currentLocation,
                  initialData: null,
                  builder: (context, snapshot) => snapshot.hasData
                      ? Text(
                          snapshot.data!.location,
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      : snapshot.hasError
                          ? Text(
                              "${snapshot.error}: \nStackTrace: ${snapshot.stackTrace}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error))
                          : const CircularProgressIndicator());
        });
  }
}
