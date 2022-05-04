import 'package:clubhouse_clone/pages/home/follower_page.dart';
import 'package:clubhouse_clone/pages/home/widgets/home_app_bar.dart';
import 'package:clubhouse_clone/pages/lobby/lobby_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  // User? result = FirebaseAuth.instance.currentUser;

  GoogleSignIn _googleSignIn;
  User _user;

  HomePage(User user, GoogleSignIn signIn, {Key key}) : super(key: key) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(_user, _googleSignIn),
      ),
      body: PageView(
        children: [
          LobbyPage(_user, _googleSignIn),
          FollowerPage(_user, _googleSignIn),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User>('_user', _user));
  }
}
