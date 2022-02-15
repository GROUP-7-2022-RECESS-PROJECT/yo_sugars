import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yo_sugars/screens/profile/TabButton.dart';
import 'package:yo_sugars/screens/profile/TabLabel.dart';

// import '../packages_exporter.dart';
import 'profile_pic.dart';
// import 'sign_out_button.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({Key? key}) : super(key: key);
  @override
  _UserProfileBodyState createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  FirebaseAuth signedin = FirebaseAuth.instance;
  FirebaseAuth signout = FirebaseAuth.instance;
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
          Center(
            child: Text(
              "Signed in as: " + "${signedin.currentUser!.email}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
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
              launch("tel:+256789530574");
            },
          ),
          TabButton(
            label: "Report a problem",
            icon: Icons.mail,
            page: () {
              launch(
                  "mailto:bagendasamuel3@gmail.com.com?subject=Report%20Problem");
            },
          ),
          TabButton(
            label: 'Send Feedback',
            icon: Icons.feedback_outlined,
            page: () {
              launch(
                  "mailto:lindakellen9@gmail.com.com?subject=Report%20Problem");
            },
          ),
          const TabLabel(
            label: 'More',
            color: Colors.white,
            align: Alignment.centerLeft,
          ),
          const SizedBox(height: 10.0),
          // ListButton(
          //   label: 'About',
          //   icon: Icons.help_outline,
          //   onTap: () {},
          // ),
          ListButton(
            label: 'Sign Out',
            icon: Icons.outbond_outlined,
            onTap: () {
              signingout();
            },
          ),
        ],
      ),
    );
  }
}
