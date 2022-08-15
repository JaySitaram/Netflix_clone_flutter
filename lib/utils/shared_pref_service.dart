import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static Future<SharedPreferences> get prefs async=> await SharedPreferences.getInstance();
  static SharedPreferences? preferences;

  static init() async{
    if(preferences!=null) return preferences;
    preferences=await prefs;
    return preferences;
  }

  static setStringValue(String key,String value) {
    return preferences!.setString(key, value);
  }

  static getStringValue(String key){
    return preferences!.getString(key)??'';
  }

  static setBoolValue(String key,bool value){
    return preferences!.setBool(key, value);
  }

  static getBoolValue(String key){
    init();
    return preferences!.getBool(key)??false;
  }
}