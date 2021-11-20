import 'package:deso_sdk/deso_sdk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:deso_sdk/src/model/general/app_state.model.dart';

class DesoNodeData extends ChangeNotifier {

  static final String _defaultEndpoint = "love4src.com";
  static final int _defaultDesoExchangeRateUSD = 8000;
  static final keyDesoApiPreference = "deso-node-data.api-preference";

  final SharedPreferences sharedPreferences;

  String _apiEndpoint = _defaultEndpoint;

  Deso _sdk = new Deso();
  
  AppState? _appState;

  DesoNodeData(this.sharedPreferences) {
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

}