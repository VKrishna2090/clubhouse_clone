import 'package:clubhouse_clone/pages/welcome/otp_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/history.dart';

import 'fullname_page.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final _phoneNumberController = TextEditingController();
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
              'Sign in with your phone #',
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
      child: Row(
        children: [
          CountryCodePicker(
            initialSelection: "IN",
            showCountryOnly: false,
            alignLeft: false,
            padding: const EdgeInsets.all(8),
            textStyle: const TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (value.length < 10 || value.length > 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter a valid phone number')),
                      );
                    } else {
                      if (_phoneNumberController.text.isNotEmpty) {
                        next();
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter your phone number')),
                    );
                  }
                  return null;
                },
                controller: _phoneNumberController,
                autocorrect: false,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
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
          ),
        ],
      ),
    );
  }

  Widget buildBottom() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'By entering your number, you\'re agreeing to our Terms or Services and Privacy Policy. Thanks!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
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
    History.pushPageUntil(context, OtpPage());
  }
}
