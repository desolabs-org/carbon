import 'dart:convert';
import 'package:carbon/dao/models/deso_ninja/feed_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DesoNinjaDao extends ChangeNotifier {

  static final String _defaultNinjaEndpoint = "deso.ninja";

  String _ninjaEndpoint = _defaultNinjaEndpoint;
  String get endpoint => _ninjaEndpoint;

  Future<FeedData> getFeedData(String feedId) async {
    final client = new http.Client();
    FeedData? responseData;
    try {
      final response = await client.get(
          Uri.https(_ninjaEndpoint, '/api/1/feed/' + feedId),
          headers: {
            "Content-Type": "application/json"
          });
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = (jsonDecode(response.body) as Map<String, dynamic>);
        responseData = FeedData.fromJson(jsonData);
      }
    } catch(e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      client.close();
    }

    return responseData??FeedData();
  }
}