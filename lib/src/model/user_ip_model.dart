import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math';

class PresentIP extends ChangeNotifier {
  Future<String>? _ip;
  Future<String> get ip => _ip ?? getIP();
  final _random = Random();

  Future<String> getIP() async {
    http.Response response =
        await http.get(Uri.https("api.ipify.org", '', {"format": "json"}));
    String ip = "182.79.4.245";
    if (response.statusCode == 200) {
      ip = convert.jsonDecode(response.body)['ip'];
    }
    final List<String> ips = [
      "18.194.217.1",
      "178.248.210.198",
      "200.53.20.122",
      ip,
    ];
    _ip = Future.value(ips[_random.nextInt(ips.length)]);
    notifyListeners();
    return ips[_random.nextInt(ips.length)];
  }
}
