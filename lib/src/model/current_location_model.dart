import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CurrentLocation /* extends ChangeNotifier */ {
  final Future<String> ip;
  CurrentLocation({required this.ip});

  Future<String> get location => getLocation();

  Future<String> getLocation() async {
    http.Response response = await http.get(await _generateApiUri());
    final decodedJson = convert.jsonDecode(response.body);
    return decodedJson['country'];
  }

  Future<Uri> _generateApiUri() async {
    String ipString = await ip;
    return Uri.http("ip-api.com", "/json/$ipString", {"fields": "655385"});
  }
}
