import 'package:http/http.dart' as http;

class CurrentLocationAPI {
  static const _ipApiBaseUrl = "api.ipify.org";
  // static const _ipApiPath = ''; // currently under stuff??
  // static const _ipApiQuries = {"format": "json"};

  static const _locationApiBaseUrl = "ip-api.com";
  static const _locationApiBasePath = "/json/";
  static const _impFields = "139785";
  static const _locationApiBaseQuries = {"fields": _impFields};

  Uri ip() => _buildUri(base: _ipApiBaseUrl);
  Future<Uri> location() async => _buildUri(
      base: _locationApiBaseUrl,
      // TODO: fix dirty implementation
      path: "$_locationApiBasePath${(await http.get(ip())).body}",
      queries: _locationApiBaseQuries);

  Uri _buildUri(
      {required String base,
      String path = '',
      Map<String, dynamic> queries = const {'': ''}}) {
    return Uri.http(base, path, queries);
  }
}
