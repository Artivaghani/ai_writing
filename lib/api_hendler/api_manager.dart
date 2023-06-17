import 'dart:convert';
import 'dart:io';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<Map<String, dynamic>> callGet(String url,
      {Map<String, String>? headers}) async {
    bool isNet = await AppFunctions.checkInternet(isShowMsg: false);
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        http.Response response =
            await http.get(Uri.parse(url), headers: headers).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw AppString.requesttimeout;
          },
        );
        if (response.statusCode == 401) {
          await AppFunctions.logout();
        }
        finalresponse = checkResponse(response);
        return finalresponse;
      } on SocketException catch (_) {
        throw AppString.checkConnection;
      }
    } else {
      throw AppString.checkConnection;
    }
  }

  static Future<Map<String, dynamic>> callDelete(String url,
      {Map<String, String>? headers, Map<String, String>? body}) async {
    bool isNet = await AppFunctions.checkInternet(isShowMsg: false);
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        http.Response response = await http
            .delete(Uri.parse(url), headers: headers, body: body)
            .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw AppString.requesttimeout;
          },
        );
        if (response.statusCode == 401) {
          await AppFunctions.logout();
        }
        finalresponse = checkResponse(response);
        return finalresponse;
      } on SocketException catch (_) {
        throw AppString.checkConnection;
      }
    } else {
      throw AppString.checkConnection;
    }
  }

  static Future<Map<String, dynamic>> callPost(String url,
      {Map<String, String>? headers, Map<String, String>? body}) async {
    bool isNet = await AppFunctions.checkInternet(isShowMsg: false);
   print('param ${body}');
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        http.Response response =
            await http.post(Uri.parse(url), headers: headers, body: body);
        if (response.statusCode == 401) {
          await AppFunctions.logout();
        }
        finalresponse = checkResponse(response);
        return finalresponse;
      } on SocketException catch (_) {
        throw AppString.checkConnection;
      }
    } else {
      throw AppString.checkConnection;
    }
  }

  static Map<String, dynamic> checkResponse(http.Response response) {
    if (response.statusCode == 200) {
      Map<String, dynamic> rData = json.decode(response.body);
      print('response ${rData}');
      if (rData['status']) {
        return rData;
      } else {
        throw rData['message'];
      }
    } else {
      throw Exception(AppString.errorMsg);
    }
  }
}
