import 'package:clubhouse_clone/utils/data.dart';
import 'package:clubhouse_clone/utils/style.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: Style.AccentBrown, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0, len = 2; i < len; i++)
            Padding(
              padding: const EdgeInsets.all(8),
              child: buildScheduleItem("0${6 + i}:00 PM", dummyText),
            )
        ],
      ),
    );
  }

  Widget buildScheduleItem(String time, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 75,
          child: Text(
            time,
            style: const TextStyle(color: Style.DarkBrown),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "COMMUNITY CLUB",
                    style: TextStyle(
                      color: Style.AccentGrey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.home,
                    color: Style.AccentGreen,
                    size: 15,
                  )
                ],
              ),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
