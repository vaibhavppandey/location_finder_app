import 'package:flutter/material.dart';
import 'package:http_sth/src/repository/current_location_repository.dart';
import 'package:provider/provider.dart';

class CurrentLocationPageFab extends StatefulWidget {
  const CurrentLocationPageFab({super.key});

  @override
  State<CurrentLocationPageFab> createState() => _CurrentLocationPageFabState();
}

class _CurrentLocationPageFabState extends State<CurrentLocationPageFab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationRepository>(
      builder: (context, repository, _) => ValueListenableBuilder(
          valueListenable: repository.connectionState,
          builder: (_, connectionState, __) {
            return FloatingActionButton.extended(
              onPressed: connectionState == ConnectionState.waiting
                  ? null
                  : repository
                      .recheckLocation /* context.read<PresentIP>().getIP */,
              label: Text(connectionState.toString()),
              icon: connectionState == ConnectionState.waiting
                  ? const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ))
                  : const Icon(Icons.restart_alt_rounded),
            );
          }),
    );
  }
}
