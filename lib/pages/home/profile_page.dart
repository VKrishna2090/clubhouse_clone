import 'package:clubhouse_clone/models/User.dart';
import 'package:clubhouse_clone/utils/data.dart';
import 'package:clubhouse_clone/widgets/round_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User profile;

  const ProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            buildProfile(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundImage(
          path: profile.profileImage,
          width: 100,
          height: 100,
          borderRadius: 35,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          profile.name.toString(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          profile.username.toString(),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: profile.followers,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: ' followers'),
                ],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: profile.following,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: ' following'),
                ],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            dummyText,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
