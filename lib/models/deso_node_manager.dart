import 'dart:convert';
import 'package:carbon/models/feed_data.dart';
import 'package:deso_sdk/deso_sdk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:deso_sdk/src/model/general/app_state.model.dart';
import 'package:http/http.dart' as http;

class DesoNodeManager extends ChangeNotifier {

  static final String _defaultEndpoint = "love4src.com";
  static final String _defaultNinjaEndpoint = "deso.ninja";
  static final int _defaultDesoExchangeRateUSD = 8000;
  static final keyDesoApiPreference = "deso-node-data.api-preference";

  final SharedPreferences sharedPreferences;

  String _apiEndpoint = _defaultEndpoint;
  String _ninjaEndpoint = _defaultNinjaEndpoint;

  Deso _sdk = new Deso();
  
  AppState? _appState;

  DesoNodeManager(this.sharedPreferences) {
    _load();
    _initialize();
  }

  void _initialize() {
    _sdk.client.init(host: _apiEndpoint, apiVersion: 0);
    _sdk.general.appState(publicKey: "somekey").then(
      (value) => value.fold(
        (apiError) => debugPrint(apiError.toJson().toString()),
        (newAppState) {
          _appState = newAppState;
          notifyListeners();
        }
      )
    );
  }

  void _load() {
    _apiEndpoint = sharedPreferences.getString(keyDesoApiPreference)??_defaultEndpoint;
  }

  void _store() {
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString(keyDesoApiPreference, _apiEndpoint)
    );
  }

  String get apiEndpoint => _apiEndpoint;

  set apiEndpoint(value) {
    _apiEndpoint = value;
    _initialize();
    _store();
  }

  double get exchangeUSD => (_appState?.usdCentsPerDeSoExchangeRate??_defaultDesoExchangeRateUSD) / 100;

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

  Future<Map<dynamic, dynamic>> getGlobalFeed() async {
    final client = new http.Client();
    Map<dynamic, dynamic> responseData = {};
    try {
      final response = await client.post(
          Uri.https(_apiEndpoint, 'api/v0/get-posts-stateless'),
          headers: {
            "Content-Type": "application/json"
          },
          body: jsonEncode(
          {
            "PostHashHex": "",
            "ReaderPublicKeyBase58Check": "BC1YLhwpmWkgk2iM9yTSxzgUVhYjgessSPTiVHkkK9pMrhweqJnWrvK",
            "OrderBy": "",
            "StartTstampSecs": null,
            "PostContent": "",
            "NumToFetch": 4,
            "FetchSubcomments": false,
            "GetPostsForFollowFeed": false,
            "GetPostsForGlobalWhitelist": true,
            "GetPostsByDESO": false,
            "MediaRequired": false,
            "PostsByDESOMinutesLookback": 0,
            "AddGlobalFeedBool": true
          }));
      if (response.statusCode == 200) {
        responseData = jsonDecode(response.body) as Map<dynamic, dynamic>;
      }
    } catch(e) {
      debugPrint(e.toString());
    } finally {
      client.close();
    }

    return responseData;
  }

}