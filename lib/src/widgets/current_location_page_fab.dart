import 'package:flutter/material.dart';
import 'package:http_sth/src/model/user_ip_model.dart';
import 'package:provider/provider.dart';

class CurrentLocationPageFab extends StatelessWidget {
  const CurrentLocationPageFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: context.read<PresentIP>().getIP,
        label: const Text("Recheck IP"),
        icon: const Icon(Icons.restart_alt_rounded));
  }
}
