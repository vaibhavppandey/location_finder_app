import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:logger/logger.dart';
import 'dart:math';

final _logger = Logger(level: Level.debug);

class PresentIP extends ChangeNotifier {
  Future<String>? _ip;
  final ValueNotifier<ConnectionState> _connectionState =
      ValueNotifier<ConnectionState>(ConnectionState.none);
  Future<String> get ip => _ip ?? getIP();
  ValueNotifier<ConnectionState> get connectionState => _connectionState;
  final _random = Random();

  Future<String> getIP() async {
    _connectionState.value = ConnectionState.waiting;
    http.Response response =
        await http.get(Uri.https("api.ipify.org", '', {"format": "json"}));
    String ip = _generateRandomIP(convert.jsonDecode(response.body)['ip']);
    _logger.d("previous ip: ${await _ip}");
    _ip = Future.value(ip);
    _logger.d("after ip: ${await _ip}");
    _connectionState.value = ConnectionState.active;
    notifyListeners();

    return _generateRandomIP(ip);
  }

  String _generateRandomIP(String currentIP) {
    final List<String> ips = [
      "18.194.217.1",
      "178.248.210.198",
      "200.53.20.122",
      currentIP,
    ];
    return ips[_random.nextInt(ips.length)];
  }
}
