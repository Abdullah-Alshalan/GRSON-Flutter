import 'package:GRSON/firebase/authrRepository.dart';
import 'package:GRSON/secondPages/theme/Theme.dart';
import 'package:GRSON/welcomePages/components/enum.dart';
import 'package:GRSON/welcomePages/components/rounded_passwordCON_field.dart';
import 'package:GRSON/welcomePages/constants.dart';
import 'package:flutter/material.dart';
import 'package:GRSON/welcomepages/Signup/components/background.dart';
import 'package:GRSON/welcomepages/components/already_have_account.dart';
import 'package:GRSON/welcomepages/components/rounded_button.dart';
import 'package:GRSON/welcomepages/components/rounded_input_email_field.dart';
import 'package:GRSON/welcomepages/components/rounded_input_person_field.dart';
import 'package:GRSON/welcomepages/components/rounded_password_field.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  final AuthrRepository _auth = AuthrRepository.instance;
  Body({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyBody();
}

class _MyBody extends State<Body> {
  String _email = '';
  String _password = '';
  String _userName = '';
  SingingCharacter temp = SingingCharacter.customer;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      page: 'WelcomePage', //this is for back button
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputEmailField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            RoundedInputPersonField(
              hintText: "Your Username",
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            // RoundedConfirmPasswordField(
            //   onChanged: (value) {},
            // ),
            Divider(
              color: ArgonColors.muted,
              height: 10,
              thickness: 0.5,
              indent: 40,
              endIndent: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Radio(
                activeColor: kPrimaryColor,
                value: SingingCharacter.customer,
                groupValue: temp,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    temp = value;
                  });
                },
              ),
              Text(
                'Customer',
                style: TextStyle(fontSize: 20),
              ),
              Radio(
                activeColor: kPrimaryColor,
                value: SingingCharacter.restaurant,
                groupValue: temp,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    temp = value;
                  });
                },
              ),
              Text(
                'Restaurant',
                style: TextStyle(fontSize: 20),
              ),
            ]),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                signUp();
              },
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacementNamed(context, 'Sign In');
              },
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }

  signUp() async {
    try {
      String uid = await widget._auth.signUp(_email, _password, _userName);
      if (temp == SingingCharacter.customer)
        Navigator.pushReplacementNamed(context, '/home');
      else
        Navigator.pushReplacementNamed(context, "Restaurant");
    } on PlatformException catch (e) {
      // Navigator.pushReplacementNamed(context, "WelcomePage");
    }
  }
}
