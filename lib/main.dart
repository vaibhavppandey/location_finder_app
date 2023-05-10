import 'package:flutter/material.dart';
import 'package:http_sth/src/model/current_location_model.dart';
import 'package:http_sth/src/model/current_location_model.dart'
    show CurrentLocation;
import 'package:http_sth/src/model/user_ip_model.dart' show PresentIP;
import 'package:provider/provider.dart';
import 'package:http_sth/src/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PresentIP()),
        ProxyProvider<PresentIP, CurrentLocation>(
            update: (_, presentIP, oldCurrentLocation) {
          CurrentLocation currentLocation = CurrentLocation(
              ip: presentIP.ip, providedLocation: oldCurrentLocation?.location);
          return currentLocation;
        })
      ],
      child: const NameToBeDecidedApp(),
    ),
  );
}
