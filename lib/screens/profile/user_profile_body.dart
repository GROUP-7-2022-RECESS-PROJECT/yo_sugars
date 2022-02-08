import 'package:flutter/material.dart';
import 'package:yo_sugars/screens/profile/TabButton.dart';
import 'package:yo_sugars/screens/profile/TabLabel.dart';
import 'profile_pic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({Key? key}) : super(key: key);
  @override
  _UserProfileBodyState createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
   
  FirebaseAuth signout = FirebaseAuth.instance;
  FirebaseAuth signedin = FirebaseAuth.instance;

  signingout() async {
      await signout.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ProfilePic(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                "Signed in as: " + "${signedin.currentUser!.email}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "+256 778 456783",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          const TabLabel(
              label: 'Get Help',
              color: Colors.white,
              align: Alignment.centerLeft),
          const SizedBox(height: 10.0),
          TabButton(
            label: "Call Help Line",
            icon: Icons.phone_forwarded_outlined,
            page: () {
              launch("tel:+256786953357");
            },
          ),
          TabButton(
            label: "Report a problem",
            icon: Icons.mail,
            page: () {
              launch(
                  "mailto:rinahnalu2001@gmail.com.com?subject=Report%20Problem");
            },
          ),
          TabButton(
            label: 'Send Feedback',
            icon: Icons.feedback_outlined,
            page: () {
              launch(
                  "mailto:rinahnalu2001@gmail.com.com?subject=Report%20Problem");
            },
          ),
          const TabLabel(
            label: 'More',
            color: Colors.white,
            align: Alignment.centerLeft,
          ),
          const SizedBox(height: 10.0),
          ListButton(
            label: 'About',
            icon: Icons.help_outline,
            onTap: () {},
          ),
          ListButton(
            label: 'Signout',
            icon: Icons.help_outline,
            onTap: () {
              signingout();
            },
          ),
        ],
      ),
    );
  }
}
