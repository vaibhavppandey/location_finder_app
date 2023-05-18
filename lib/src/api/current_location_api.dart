class CurrentLocationAPI {
  static const _ipApiBaseUrl = "api.ipify.org";
  // static const _ipApiPath = ''; // currently under stuff??
  static const _ipApiQuries = {"format": "json"};

  static const _locationApiBaseUrl = "ip-api.com";
  static const _locationApiBasePath = "/json/";
  static const _impFields = "139785";
  static const _locationApiBaseQuries = {"fields": _impFields};

  Uri ip() => _buildUri(base: _ipApiBaseUrl, queries: _ipApiQuries);
  Future<Uri> location() async => _buildUri(
      base: _locationApiBaseUrl,
      path: "$_locationApiBasePath/${ip()}",
      queries: _locationApiBaseQuries);

  Uri _buildUri(
      {required String base,
      String path = '',
      Map<String, dynamic> queries = const {'': ''}}) {
    return Uri.https(base, path, queries);
  }
}
