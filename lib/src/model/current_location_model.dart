import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:logger/logger.dart';

final _logger = Logger();

class CurrentLocation /* extends ChangeNotifier */ {
  final Future<String> ip;
  final Future<String?>? providedLocation;

  Future<String?>? _location;

  CurrentLocation({required this.ip, required this.providedLocation})
      : _location = providedLocation;

  Future<String?> get location => _location ?? getLocation();

  Future<String?> getLocation() async {
    _logger.d("_location before get: ${await _location}");
    http.Response response = await http.get(await _generateApiUri());
    final decodedJson = convert.jsonDecode(response.body);
    _location = Future.value(decodedJson['country']);
    _logger.d("_location after get: ${await _location}");
    return decodedJson['country'];
  }

  void setLocation(Future<String?>? location) {
    _location = location;
  }

  Future<Uri> _generateApiUri() async {
    String ipString = await ip;
    // _location = Future.value(null); TODO: make this work
    return Uri.http("ip-api.com", "/json/$ipString", {"fields": "655385"});
  }

  @override
  String toString() {
    return "CurrentLocation($_location)";
  }
}
