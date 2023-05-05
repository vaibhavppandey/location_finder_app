import 'package:flutter/material.dart';
import 'package:http_sth/src/widgets/current_location_future_builder.dart'
    show CurrentLocationFutureBuilder;
import 'package:http_sth/src/widgets/current_location_page_fab.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 0), _showInaccurateLocationAlertDialog);
    return const Scaffold(
      body: Center(child: CurrentLocationFutureBuilder()),
      floatingActionButton: CurrentLocationPageFab(),
    );
  }

  void _showInaccurateLocationAlertDialog() => showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text("Inaccurate location"),
            content:
                const Text("Location about to be displayed is not accurate"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("ok"))
            ],
          ));
}
