import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubhouse_clone/models/room.dart';
import 'package:clubhouse_clone/pages/home/profile_page.dart';
import 'package:clubhouse_clone/pages/room/room_page.dart';
import 'package:clubhouse_clone/utils/data.dart';
import 'package:clubhouse_clone/utils/history.dart';
import 'package:clubhouse_clone/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'widgets/follower_Item.dart';

class FollowerPage extends StatelessWidget {
  GoogleSignIn _googleSignIn;
  User _user;

  FollowerPage(User user, GoogleSignIn signIn, {Key key}) : super(key: key) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: Column(
        children: [
          buildAvailableChatTitle(),
          buildAvailableChatList(context),
        ],
      ),
    );
  }

  Widget buildAvailableChatTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'AVAILABLE TO CHAT',
          style: TextStyle(
            color: Style.DarkBrown,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Style.DarkBrown,
          ),
        ),
      ],
    );
  }

  Widget buildAvailableChatList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (lc, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FollowerItem(
            user: users[index],
            onProfileTap: () {},
            onRoomButtonTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  var room = {
                    "id": "1",
                    "title": '${_user.displayName}\'s Room',
                    "moderator": _user.uid,
                    "speakerCount": 1,
                    "users": [_user.uid, users[index].uid],
                    "userCount": 2
                  };
                  var db = FirebaseFirestore.instance;
                  db.collection('rooms').doc("rooms").set(room);
                  return RoomPage(
                    _user,
                    _googleSignIn,
                    Room(
                      title: '${_user.displayName}\'s Room',
                      users: [myProfile, users[index]],
                      speakerCount: 1,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
