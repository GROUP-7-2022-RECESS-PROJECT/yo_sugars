import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yo_sugars/screens/bmi.dart';
import 'package:yo_sugars/screens/mydiet.dart';
import 'package:yo_sugars/screens/profile/TabButton.dart';
import 'package:yo_sugars/screens/profile/user_profile.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  FirebaseAuth signout = FirebaseAuth.instance;
  FirebaseAuth signedin = FirebaseAuth.instance;
  signingout() async {
    await signout.signOut();
  }

  GlobalKey<ScaffoldState> _openDrawer = GlobalKey<ScaffoldState>();
  Drawer _showDrawer() {
    return Drawer(
        child: Container(
      color: Colors.blue[200],
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.yellow,
            ),
            accountName: Text("User"),
            accountEmail: Text(
              "Signed in as: " + "${signedin.currentUser!.email}",
            ),
          ),
          ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text("My Diet"),
              onTap: () {
                setState(() {
                  currentTabIndex = 0;
                });
                openCloseDrawer();
              }),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
              leading: const Icon(Icons.person_search_outlined),
              title: const Text("BMI"),
              onTap: () {
                setState(() {
                  currentTabIndex = 1;
                });
                openCloseDrawer();
              }),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
              leading: const Icon(Icons.person_search_outlined),
              title: const Text("User Profile"),
              onTap: () {
                setState(() {
                  currentTabIndex = 2;
                });
                openCloseDrawer();
              }),
          const Divider(
            color: Colors.white,
          ),
          ListButton(
            label: 'Sign Out',
            icon: Icons.outbond_outlined,
            onTap: () {
              signingout();
              Navigator.of(context).pop();
            },
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "2022 | YoSugars ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  List<Widget> tabs = [const MyDiet(), const BMI(), UserInfoScreen()];

  int currentTabIndex = 0;

  void openCloseDrawer() {
    if (_openDrawer.currentState!.isDrawerOpen) {
      _openDrawer.currentState!.openEndDrawer();
    } else {
      _openDrawer.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _showDrawer(),
      key: _openDrawer,
      appBar: AppBar(
        title: const Text("YoSugars"),
      ),
      body: tabs[currentTabIndex],
    );
  }
}
