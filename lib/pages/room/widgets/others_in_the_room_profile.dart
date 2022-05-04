import 'package:clubhouse_clone/models/User.dart';
import 'package:clubhouse_clone/pages/home/profile_page.dart';
import 'package:clubhouse_clone/utils/history.dart';
import 'package:clubhouse_clone/utils/style.dart';
import 'package:clubhouse_clone/widgets/round_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OthersInTheRoomProfile extends StatelessWidget {
  MyUser user;
  double size;
  bool isMute;
  bool isModerator;
  GoogleSignIn _googleSignIn;
  User _user;

  OthersInTheRoomProfile(MyUser myuser1, double size1, bool isMute1,
      bool isModerator1, GoogleSignIn signIn1, User user1,
      {Key key})
      : super(key: key) {
    user = myuser1;
    size = size1;
    isMute = isMute1;
    isModerator = isModerator1;
    _user = user1;
    _googleSignIn = signIn1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                // History.pushPage(
                //     context,
                //     ProfilePage(
                //       user,
                //     ));
              },
              child: RoundImage(
                path: user.profileImage,
                width: size,
                height: size,
              ),
            ),
            buildNewBadge(user.isNewUser),
            buildMuteBadge(isMute),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildModeratorBadge(isModerator),
            Text(
              user.name.split(' ')[0],
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildModeratorBadge(bool isModerator) {
    return isModerator
        ? Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: Style.AccentGreen,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.star,
              color: Colors.white,
              size: 12,
            ),
          )
        : Container();
  }

  Widget buildMuteBadge(bool isMute) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: isMute
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: const Icon(Icons.mic_off),
            )
          : Container(),
    );
  }

  Widget buildNewBadge(bool isNewUser) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: isNewUser
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: const Text(
                '🎉',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : Container(),
    );
  }
}
