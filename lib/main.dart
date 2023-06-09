import 'package:flutter/material.dart';
import 'package:http_sth/src/api/current_location_api.dart';
import 'package:http_sth/src/model/current_location_model.dart';
import 'package:http_sth/src/model/current_location_model.dart'
    show CurrentLocation;
import 'package:http_sth/src/model/user_ip_model.dart' show PresentIP;
import 'package:http_sth/src/repository/current_location_repository.dart';
import 'package:provider/provider.dart';
import 'package:http_sth/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => LocationRepository(api: CurrentLocationAPI())),
        // ChangeNotifierProvider(create: (_) => PresentIP()),
        // ProxyProvider<PresentIP, CurrentLocation>(
        //     update: (_, presentIP, __) => CurrentLocation(ip: presentIP.ip)),
      ],
      child: const NameToBeDecidedApp(),
    ),
  );
}
