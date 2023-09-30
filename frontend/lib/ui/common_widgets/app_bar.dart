import 'package:flutter/material.dart';
import 'package:frontend/services/auth_services.dart';

class NavBar extends StatefulWidget {
  final Icon appIcon;
  final bool loggedIn;

  const NavBar({super.key, required this.appIcon, required this.loggedIn});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        leading: widget.appIcon,
        actions: createNavActions(),
      ),
    );
  }

  List<Widget> createNavActions() {
    if (widget.loggedIn) {
      return [
        createSearchBar(),
        createNavAction("", "", false),
        createNavAction("Home", "/home", true),
        createNavAction("Community", "", false),
        createNavAction("Pair Study", "", false),
        FilledButton.tonal(
            onPressed: () {},
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('Create Space'),
              ],
            )),
        createNavAction("", "", false),
      ];
    }
    return [
      createSearchBar(),
      createNavAction("", "", false),
      createNavAction("Home", "/", true),
      createNavAction("About Us", "", false),
      createNavAction("Our Services", "", false),
      FilledButton.tonal(onPressed: () {}, child: const Text('Login/Register')),
      createNavAction("", "", false),
    ];
  }

  SizedBox createSearchBar() {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.04,
      width: size.width * 0.25,
      child: SearchBar(
        elevation: MaterialStateProperty.all(0.25),
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        onTap: () {},
        leading: const Icon(Icons.search),
        hintStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
        hintText: "Find your academic solutions",
      ),
    );
  }

  Widget createNavAction(String title, String navigateTo, bool isActive) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(onTap: () {}, child: Text(title)),
          if (isActive)
            Container(
              height: size.height * 0.0025,
              width: size.width * 0.01,
              color: Colors.blueGrey,
            )
        ],
      ),
    );
  }
}
