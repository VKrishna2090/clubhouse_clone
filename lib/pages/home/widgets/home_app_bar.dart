import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/User.dart';
import '../../../widgets/round_image.dart';

class HomeAppBar extends StatelessWidget {
  final User? profile;
  final VoidCallback? onProfileTab;

  const HomeAppBar({Key? key, this.profile, this.onProfileTab})
      : super(key: key);

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
              onTap: onProfileTab,
              child: RoundImage(
                path: profile!.profileImage,
                width: 40,
                height: 40,
              ),
            )
          ],
        ),
      ],
    );
  }
}
