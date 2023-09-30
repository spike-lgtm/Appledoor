import 'package:flutter/material.dart';
import 'package:frontend/services/auth_services.dart';
import 'package:frontend/ui/auth/login.dart';
import 'package:frontend/ui/auth/register.dart';
import 'package:frontend/ui/common_widgets/wrapper.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    late AuthServices authServices;

    return Wrapper(
      authSession: (session) {
        authServices = session;
      },
        body: SizedBox(
      width: size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blueAccent[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _controller,
                // give the indicator a decoration (color and border radius)
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.blueAccent[300],
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Login',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Register',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  // first tab bar view widget
                  Center(
                    child: Login(),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Register(
                      onRegister: (user) async {
                        bool registered = await authServices.register(user);
                        if(registered) {
                          Navigator.pushNamed(context, "/home");
                        }
                      },
                      moveToLogin: () {
                        _controller.animateTo(0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
