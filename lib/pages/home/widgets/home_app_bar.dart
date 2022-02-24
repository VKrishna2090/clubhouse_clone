import 'package:clubhouse_clone/utils/history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../widgets/round_image.dart';
import '../profile_page.dart';

class HomeAppBar extends StatelessWidget {
  // final MyUser profile;
  // final VoidCallback onProfileTab;

  GoogleSignIn _googleSignIn;
  User _user;

  HomeAppBar(User user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(CupertinoIcons.compass),
          iconSize: 30.0,
          onPressed: () {},
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              icon: const Icon(CupertinoIcons.envelope_open),
              iconSize: 27.0,
              onPressed: () {},
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.calendar),
              iconSize: 30.0,
              onPressed: () {},
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.bell),
              iconSize: 30.0,
              onPressed: () {},
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                History.pushPage(context, ProfilePage(_user, _googleSignIn));
              },
              child: ClipOval(
                  child: Image.network(_user.photoURL as String,
                      width: 30, height: 30, fit: BoxFit.cover)),
            )
          ],
        ),
      ],
    );
  }
}
