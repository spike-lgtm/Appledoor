import 'package:flutter/material.dart';
import 'package:frontend/services/auth_services.dart';
import 'package:frontend/ui/auth/auth.dart';
import 'package:frontend/ui/common_widgets/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  final Widget body;
  final Function(AuthServices) authSession;

  const Wrapper({super.key, required this.body, required this.authSession});

  @override
  State<Wrapper> createState() => _RootState();
}

class _RootState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _loadApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(100),
                  child: NavBar(
                    appIcon: Icon(Icons.apple),
                    loggedIn: snapshot.data!,
                  )),
              body: Center(
                child: widget.body,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<bool> _loadApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthServices authServices = AuthServices(prefs);
    widget.authSession(authServices);
    return authServices.isUserLoggedIn;
  }
}
