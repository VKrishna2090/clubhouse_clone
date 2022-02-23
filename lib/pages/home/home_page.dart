import 'package:flutter/material.dart';
import '../../pages/lobby/follower_Page.dart';
import '../../pages/lobby/lobby_Page.dart';
import '../../utils/data.dart';
import '../../utils/history.dart';

import 'profile_page.dart';
import 'widgets/home_App_Bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(
          profile: myProfile,
          onProfileTab: () {
            History.pushPage(
                context,
                ProfilePage(
                  profile: myProfile,
                ));
          },
        ),
      ),
      body: PageView(
        children: [
          LobbyPage(),
          FollowerPage(),
        ],
      ),
    );
  }
}
