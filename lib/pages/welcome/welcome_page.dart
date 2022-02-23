import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/history.dart';

import 'phone_number_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/welcome_logo.png',
              ),
            ),
            const SizedBox(height: 120),
            buildBottom(context),
          ],
        ),
      ),
    );
  }

  Widget buildBottom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            History.pushPage(context, PhoneNumberPage());
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: const Color(0xff5B75A6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "🎉 Welcome in! ",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Icon(CupertinoIcons.arrow_right, color: Colors.white),
                ],
              )),
        ),
      ],
    );
  }
}
