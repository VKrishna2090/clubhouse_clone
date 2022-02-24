import 'package:clubhouse_clone/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/history.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({Key key}) : super(key: key);

  @override
  _UsernamePageState createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final _userNameController = TextEditingController();
  final _userNameformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 60,
        ),
        child: Column(
          children: [
            buildTitle(),
            const SizedBox(
              height: 130,
            ),
            buildForm(),
            const Spacer(),
            buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      'Pick a username',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm() {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: _userNameformKey,
        child: TextFormField(
          textAlign: TextAlign.center,
          validator: (value) {
            if (value.isNotEmpty) {
              if (_userNameController.text.isNotEmpty) {
                next();
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your username')),
              );
            }
          },
          controller: _userNameController,
          autocorrect: false,
          autofocus: false,
          decoration: const InputDecoration(
            hintText: '@username',
            hintStyle: TextStyle(
              fontSize: 20,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget buildBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: () {
          if (_userNameformKey.currentState.validate()) {
            //! save username and perform login session operations

          }
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
                "Next ",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Icon(CupertinoIcons.arrow_right, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  next() {
    // History.pushPageUntil(context, HomePage());
  }
}
