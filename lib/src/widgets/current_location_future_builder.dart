import 'package:flutter/material.dart';
import 'package:http_sth/src/model/current_location_model.dart'
    show CurrentLocation;
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
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CurrentLocation>(context).location,
        initialData: null,
        builder: (context, snapshot) => snapshot.hasData
            ? Text(
                snapshot.data!,
                style: Theme.of(context).textTheme.headlineMedium,
              )
            : snapshot.hasError
                ? Text("SomeError ${snapshot.error}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).colorScheme.error))
                : const CircularProgressIndicator());
  }
}
