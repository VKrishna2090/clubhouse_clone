import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/history.dart';

import 'fullname_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            const Text(
              'Enter the OTP sent to you',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
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

  Widget buildForm() {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value) {
            if (value!.isNotEmpty) {
              if (value.length < 10 || value.length > 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter the correct OTP')),
                );
              } else {
                if (_otpController.text.isNotEmpty) {
                  next();
                }
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter the OTP')),
              );
            }
            return null;
          },
          controller: _otpController,
          autocorrect: false,
          autofocus: false,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            hintText: 'OTP',
            hintStyle: TextStyle(
              fontSize: 20,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //! sign in/sign up operations

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
        ),
      ],
    );
  }

  next() {
    History.pushPageUntil(context, FullNamePage());
  }
}
