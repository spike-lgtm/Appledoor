import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.2,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Text(
              "Enter Your Credentials",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
            ),
            Container(
              height: size.height * 0.0025,
              width: size.width * 0.01,
              color: Colors.blueGrey,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            TextFormField(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            TextFormField(
              obscureText: true,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                TextButton(onPressed: () {}, child: Text("Forgot Password?"))
              ],
            ),
            Container(
              width: size.width * 0.06,
              child: ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  AuthServices authServices = AuthServices(prefs);
                  bool login = await authServices.login(LoginData(username: "username", password: "password"));
                  if(login) {
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
