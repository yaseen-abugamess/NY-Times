import 'package:http/http.dart' as http;

import 'http_util.dart';

class HttpClient {
  http.Client client;
  String host;
  Map<String, String>? header;

  HttpClient({
    required this.host,
    required this.client,
  });

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  Map<String, String> _generateAuthorizationHeader() => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

  Map<String, String> _generateRequestHeader([
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        ..._generateAuthorizationHeader(),
        ...overrideHeader,
      };

  dynamic get({required String path, String? token}) async {
    final requestHeader = token != null
        ? _generateRequestHeader({"Authorization": "Bearer $token"})
        : _generateRequestHeader();

    final http.Response response = await client.get(
      _getParsedUrl(path),
      headers: requestHeader,
    );
    return HttpUtil.getResponse(
      response,
    );
  }
}
