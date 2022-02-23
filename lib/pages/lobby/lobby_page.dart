import 'package:clubhouse_clone/models/room.dart';
import 'package:clubhouse_clone/pages/room/room_page.dart';
import 'package:clubhouse_clone/utils/data.dart';
import 'package:clubhouse_clone/utils/style.dart';
import 'package:clubhouse_clone/widgets/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/lobby_bottom_sheet.dart';
import 'widgets/room_Card.dart';
import 'widgets/schedule_Card.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 80,
              left: 20,
              right: 20,
            ),
            itemBuilder: (lc, index) {
              if (index == 0) {
                return buildScheduleCard();
              }

              return buildRoomCard(rooms[index - 1]);
            },
            itemCount: rooms.length + 1,
          ),
        ),
        buildGradientContainer(),
        buildStartRoomButton(),
      ],
    );
  }

  Widget buildScheduleCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: const ScheduleCard(),
    );
  }

  Widget buildRoomCard(Room room) {
    return GestureDetector(
      onTap: () {
        enterRoom(room);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: RoomCard(
          room: room,
        ),
      ),
    );
  }

  Widget buildGradientContainer() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Style.LightBrown.withOpacity(0.2),
          Style.LightBrown,
        ],
      )),
    );
  }

  Widget buildStartRoomButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.circle_grid_3x3_fill,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          RoundButton(
            onPressed: () {
              showBottomSheet();
            },
            color: Style.AccentGreen,
            disabledColor: const Color(0xffE8FCD9),
            child: const Text("+ Start a room",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  enterRoom(Room room) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (rc) {
        return RoomPage(
          room: room,
        );
      },
    );
  }

  showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      builder: (context) {
        return Wrap(
          children: [
            LobbyBottomSheet(
              onButtonTap: () {
                Navigator.pop(context);

                enterRoom(
                  Room(
                    title: '${myProfile.name}\'s Room',
                    users: [myProfile],
                    speakerCount: 1,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
