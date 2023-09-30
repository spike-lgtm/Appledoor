import 'package:frontend/models/user.dart';
import 'package:frontend/services/api_services.dart';
import 'package:frontend/services/session_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {

  late SessionServices sessionServices;
  late ApiService apiServices;

  AuthServices(SharedPreferences sharedPreferences) {
    sessionServices = SessionServices(sharedPreferences);
    apiServices = ApiService();
  }

  Future<bool> register(User user) async {
    Map<String, dynamic> response = await apiServices.register(user.toJson());
    if(response['token'] != null) {
      bool session = await sessionServices.setSessionData("user", response['token']);
      return session;
    }
    return false;
  }

  Future<bool> login(LoginData login) async {
    return await sessionServices.setSessionData("user", login.toJson());
  }

  bool get isUserLoggedIn {
    Map<String, dynamic>? loginMap = sessionServices.getSessionData("user");
    if(loginMap != null) {
      return true;
    }
    return false;
  }

}