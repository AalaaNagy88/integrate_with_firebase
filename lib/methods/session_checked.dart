import 'package:shared_preferences/shared_preferences.dart';

setLoginedFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("alreadyLogin", true);
}

getLoginedFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool logined = preferences.getBool("alreadyLogin") ?? false;
  return logined;
}

setLogoutFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("alreadyLogin", false);
}
