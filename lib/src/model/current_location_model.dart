import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CurrentLocation /* extends ChangeNotifier */ {
  final Future<String> ip;
  CurrentLocation({required this.ip});
  Future<String?>? _location;

  Future<String?> get location => _location ?? getLocation();

  Future<String?> getLocation() async {
    http.Response response = await http.get(await _generateApiUri());
    final decodedJson = convert.jsonDecode(response.body);
    _location = Future.value(decodedJson['country']);
    return decodedJson['country'];
  }

  Future<Uri> _generateApiUri() async {
    String ipString = await ip;
    // _location = Future.value(null); TODO: make this work
    return Uri.http("ip-api.com", "/json/$ipString", {"fields": "655385"});
  }
}
