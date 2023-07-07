// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class ChashHelper {

  static SharedPreferences? sharedPreferences;

  static  Init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putdata({
    required String Key,
    required bool Value,
  }) async {
    return await sharedPreferences!.setBool(Key, Value);
  }


  static bool? getdata({
    required String Key,
    
  })  {
    return  sharedPreferences!.getBool(Key);
  }
}
