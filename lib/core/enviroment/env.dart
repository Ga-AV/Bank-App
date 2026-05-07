import 'dart:convert';
import 'package:flutter/services.dart';

enum Enviroment { development, staging, production }

class Env {
  Env._();
  static Env? _instance;
  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }

  static String get apiBaseURL => _values['apiUrl'] ?? "";
  static String get apiKey => _values['apiKey'] ?? "";
  static String get appName {
    final appName = _values['appName'];
    if (appName == null) {
      print(
        "Warning: 'appName' is not defined in the environment configuration.",
      );
    }
    return _values['appName'] ?? '';
  }

  static Map<String, dynamic> _values = {};
  static late final Enviroment enviroment;

  static Future<void> initialize() async {
    String fileName = "";
    switch (enviroment) {
      case Enviroment.development:
        fileName = "env_dev.json";
        break;
      case Enviroment.staging:
        fileName = "env_staging.json";
        break;
      case Enviroment.production:
        fileName = "env_prod.json";
        break;
    }
    _values = await load(fileName);
  }

  static Future<Map<String, dynamic>> load(String fileName) async {
    return rootBundle.loadString(fileName).then((jsonString) {
      return json.decode(jsonString);
    });
  }
}