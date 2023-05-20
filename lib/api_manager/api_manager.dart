import 'dart:convert';
import 'dart:io';

import 'package:ai_writing/utils/app_strings.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<Map<String, dynamic>> callGet(String url, {Map<String, String>? headers}) async {
    try {
      Map<String, dynamic> finalresponse;
      http.Response response = await http.get(Uri.parse(url), headers: headers).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw AppString.requesttimeout;
        },
      );
      finalresponse = checkResponse(response);
      return finalresponse;
    } on SocketException catch (_) {
      throw AppString.checkConnection;
    }
  }

  static Future<Map<String, dynamic>> callPost(String url, {Map<String, String>? headers, Map<String, String>? body}) async {
    try {
      Map<String, dynamic> finalresponse;
      http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);
      finalresponse = checkResponse(response);
      return finalresponse;
    } on SocketException catch (_) {
      throw AppString.checkConnection;
    }
  }
}

Map<String, dynamic> checkResponse(http.Response response) {
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception(AppString.somethingWrong);
  }
}
