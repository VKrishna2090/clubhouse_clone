import 'package:clubhouse_clone/pages/home/home_page.dart';
import 'package:clubhouse_clone/utils/history.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  LoginPageWidgetState createState() => LoginPageWidgetState();
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;

  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();

    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            const Text(
              'Sign in #',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            isUserSignedIn
                ? const SizedBox(
                    height: 30,
                  )
                : buildForm(),
            const SizedBox(
              height: 100,
            ),
            isUserSignedIn
                ? const SizedBox(
                    height: 30,
                  )
                : buildBottom(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  onGoogleSignIn(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: isUserSignedIn
                      ? Colors.green
                      : Colors.deepPurpleAccent[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        isUserSignedIn
                            ? 'Logged in with Google'
                            : 'Login with Google',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<User> _handleSignIn() async {
    User user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    User user = await _handleSignIn();
    History.pushPageUntil(context, HomePage(user, _googleSignIn));
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
                  if (value.isNotEmpty) {
                    if (value.length < 10 || value.length > 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter a valid phone number')),
                      );
                    } else {
                      if (_phoneNumberController.text.isNotEmpty) {
                        // next();
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
            'By logging in, you\'re agreeing to our Terms or Services and Privacy Policy. Thanks!',
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
              if (_formKey.currentState.validate()) {}
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
                    "Send OTP ",
                    style: TextStyle(
                      fontSize: 20,
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
}
