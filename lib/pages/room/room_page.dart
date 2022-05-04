import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubhouse_clone/models/User.dart';
import 'package:clubhouse_clone/models/room.dart';
import 'package:clubhouse_clone/pages/home/profile_page.dart';
import 'package:clubhouse_clone/pages/room/widgets/others_in_the_room_profile.dart';
import 'package:clubhouse_clone/pages/room/widgets/room_profile.dart';
import 'package:clubhouse_clone/utils/data.dart';
import 'package:clubhouse_clone/utils/history.dart';
import 'package:clubhouse_clone/utils/style.dart';
import 'package:clubhouse_clone/widgets/round_button.dart';
import 'package:clubhouse_clone/widgets/round_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RoomPage extends StatelessWidget {
  Room room;
  GoogleSignIn _googleSignIn;
  User _user;

  RoomPage(User user, GoogleSignIn signIn, Room r1, {Key key})
      : super(key: key) {
    room = r1;
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              'All rooms',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // History.pushPage(
                //   context,
                //   ProfilePage(
                //     profile: myProfile,
                //   ),
                // );
              },
              child: ClipOval(
                  child: Image.network(_user.photoURL,
                      width: 30, height: 30, fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 80,
                top: 20,
              ),
              child: Column(
                children: [
                  buildTitle(room.title.toString()),
                  const SizedBox(
                    height: 30,
                  ),
                  room.speakerCount > 1
                      ? buildAllSpeakers(
                          room.users.sublist(0, room.speakerCount))
                      : buildSpeakers(room.users.sublist(0, 1)),
                  buildOthers(room.users.sublist(1, room.users.length)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottom(context),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }

  Widget buildAllSpeakers(List<MyUser> users) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 150,
      ),
      itemCount: users.length,
      itemBuilder: (gc, index) {
        return OthersInTheRoomProfile(
          users[index],
          80,
          index == 3,
          index == 0,
          _googleSignIn,
          _user,
        );
      },
    );
  }

  Widget buildSpeakers(List<MyUser> users) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 150,
      ),
      itemCount: users.length,
      itemBuilder: (gc, index) {
        return RoomProfile(
          users[index],
          80,
          index == 3,
          index == 0,
          _googleSignIn,
          _user,
        );
      },
    );
  }

  Widget buildOthers(List<MyUser> users) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Others in the room',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 100,
          ),
          itemCount: users.length,
          itemBuilder: (gc, index) {
            return OthersInTheRoomProfile(
                users[index], 60, index == 3, index == 0, _googleSignIn, _user);
          },
        ),
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          RoundButton(
            onPressed: () {
              var db = FirebaseFirestore.instance;
              db.collection('rooms').doc("rooms").delete();
              Navigator.pop(context);
            },
            color: Style.LightGrey,
            disabledColor: Color(0xffE8FCD9),
            child: const Text(
              '✌️ Leave quietly',
              style: TextStyle(
                color: Style.AccentRed,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          RoundButton(
            onPressed: () {},
            color: Style.LightGrey,
            isCircle: true,
            disabledColor: Color(0xffE8FCD9),
            child: const Icon(
              Icons.add,
              size: 15,
              color: Colors.black,
            ),
          ),
          RoundButton(
            onPressed: () {},
            color: Style.LightGrey,
            isCircle: true,
            disabledColor: Color(0xffE8FCD9),
            child: const Icon(
              Icons.thumb_up,
              size: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
