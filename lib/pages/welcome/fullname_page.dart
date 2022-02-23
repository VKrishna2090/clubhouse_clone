import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/history.dart';
import 'username_page.dart';

class FullNamePage extends StatefulWidget {
  const FullNamePage({Key? key}) : super(key: key);

  @override
  _FullNamePageState createState() => _FullNamePageState();
}

class _FullNamePageState extends State<FullNamePage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _firstNameFormKey = GlobalKey<FormState>();
  final _lastNameFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30, bottom: 60),
        child: Column(
          children: [
            const Text(
              'What\'s your full name?',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: buildForm(),
            ),
            const Spacer(),
            buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Form(
              key: _firstNameFormKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (_lastNameController.text.isNotEmpty) {
                      next();
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter your first name')),
                    );
                  }

                  return null;
                },
                controller: _firstNameController,
                autocorrect: false,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'First Name',
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
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Form(
              key: _lastNameFormKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (_firstNameController.text.isNotEmpty) {
                      next();
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter your last name')),
                    );
                  }
                },
                controller: _lastNameController,
                autocorrect: false,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
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
          ),
        )
      ],
    );
  }

  Widget buildBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: () => {
          if (_firstNameFormKey.currentState!.validate() &&
              _lastNameFormKey.currentState!.validate())
            {}
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
    //! save full name of user
    History.pushPage(context, UsernamePage());
  }
}
