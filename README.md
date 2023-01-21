# Carbon app - a frontend app for the DeSo blockchain 

The frontend by DeSo Labs community.

This is app can be used as a template for building out social apps on top of the DeSo blockchain.

License for use:
[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

## Deployment
> 1. Have Peanut installed `flutter pub global activate peanut`
> 2. Deploy to live `flutter pub global run peanut --branch live --web-renderer html`

## Tips and tricks

### JSON model
> Build JSON model `flutter pub run build_runner build`
> Clean JSON model ```flutter packages pub run build_runner build --delete-conflicting-outputs```

### Flutter web issues
> [SO post on how to disable chrome cors for devs](https://stackoverflow.com/a/66879350)
```
1- Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
2- Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
3- Find '--disable-extensions'
4- Add '--disable-web-security'
```

### Translations
Using the plugin for Flutter Intl by Localizely, and rebuild it after updating the `.arb` files