import 'dart:convert' as convert;
import 'package:flutter/widgets.dart' show ConnectionState;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:flutter/material.dart' show ChangeNotifier, ValueNotifier;
import 'package:http_sth/src/entities/current_location.dart'
    show CurrentLocation;
import 'package:http_sth/src/api/current_location_api.dart'
    show CurrentLocationAPI;

Logger _logger = Logger(level: Level.nothing);

class LocationRepository extends ChangeNotifier {
  CurrentLocationAPI api;

  LocationRepository({required this.api});

  CurrentLocation? _currentLocation;
  Future<CurrentLocation> get currentLocation async =>
      _currentLocation ?? await _updateCurrentLocation();
  ValueNotifier<ConnectionState> get connectionState => _connectionState;
  final ValueNotifier<ConnectionState> _connectionState =
      ValueNotifier<ConnectionState>(ConnectionState.none);

  Future<CurrentLocation> _updateCurrentLocation() async {
    _connectionState.value = ConnectionState.waiting;
    final http.Response response = await http.get(await api.location());
    _logger.d(
      "IP: ${api.ip()}, body: ${(await http.get(api.ip())).body}; LOCATION: ${await api.location()}, body: ${(await http.get(await api.location())).body}",
    );
    final CurrentLocation currentLocation =
        CurrentLocation.fromJson(convert.jsonDecode(response.body));
    _logger.d(currentLocation.toString());
    _currentLocation = currentLocation;
    _connectionState.value = ConnectionState.done;
    notifyListeners();
    return currentLocation;
  }

  Future<void> recheckLocation() async {
    await _updateCurrentLocation();
  }
}
