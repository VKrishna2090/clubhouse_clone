import 'package:clubhouse_clone/models/User.dart';
import 'package:clubhouse_clone/widgets/round_button.dart';
import 'package:clubhouse_clone/widgets/round_image.dart';
import 'package:flutter/material.dart';

class FollowerItem extends StatelessWidget {
  final User? user;
  final VoidCallback? onProfileTap;
  final VoidCallback onRoomButtonTap;

  const FollowerItem(
      {Key? key, this.user, this.onProfileTap, required this.onRoomButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onProfileTap,
          child: RoundImage(
            path: user!.profileImage,
            borderRadius: 15,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.name.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${user!.lastAccessTime}',
                style: const TextStyle(
                  color: Color(0xff918E81),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 25,
          child: RoundButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            onPressed: onRoomButtonTap,
            color: const Color(0xffE8FCD9),
            disabledColor: Color(0xffE8FCD9),
            child: Row(
              children: const [
                Text(
                  '+ Room',
                  style: TextStyle(
                    color: Color(0xff55AB67),
                  ),
                ),
                Icon(
                  Icons.lock,
                  color: Color(0xff55AB67),
                  size: 15,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
