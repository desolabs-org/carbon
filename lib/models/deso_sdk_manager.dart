import 'package:deso_sdk/deso_sdk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesoSdkManager extends ChangeNotifier {

  static final keyDesoApiPreference = "deso-sdk-manager.api-preference";

  final desoSdk = Deso();

  final SharedPreferences sharedPreferences;

  DesoSdkManager(this.sharedPreferences) {
    desoSdk.client.init(
      host: sharedPreferences.getString(keyDesoApiPreference)??'love4src.com',
      apiVersion: 0,
    );
  }

  setServer(String url) async {

    notifyListeners();

    SharedPreferences.getInstance()
      .then((prefs) =>
          prefs.setString(keyDesoApiPreference, desoSdk.client.host??"")
      );
  }
}