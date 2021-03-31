import 'package:GRSON/fbase/authentication_service.dart';
import 'package:GRSON/secondPages/theme/Theme.dart';
import 'package:GRSON/welcomePages/components/enum.dart';
import 'package:GRSON/welcomePages/components/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:GRSON/welcomepages/signin/components/background.dart';
import 'package:GRSON/welcomepages/components/already_have_account.dart';
import 'package:GRSON/welcomepages/components/rounded_button.dart';
import 'package:GRSON/welcomepages/components/rounded_input_email_field.dart';
import 'package:GRSON/welcomepages/components/rounded_password_field.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyBody();
}

class _MyBody extends State<Body> {
  final TextEditingController econtroller = TextEditingController();
  final TextEditingController pcontroller = TextEditingController();

  SingingCharacter temp = SingingCharacter.customer;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      page: 'WelcomePage',
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN IN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputEmailField(
              controller: econtroller,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: pcontroller,
              onChanged: (value) {},
            ),
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
              text: "SIGN IN",
              press: () {
                Provider.of<AuthenticationService>(context, listen: false)
                    .signIn(
                  // context.read<AuthenticationService>().signIn(
                  email: econtroller.text,
                  password: pcontroller.text,
                );

                if (temp == SingingCharacter.customer)
                  Navigator.pushReplacementNamed(context, '/home');
                else
                  Navigator.pushReplacementNamed(context, "Restaurant");
              },
            ),
            SizedBox(height: size.height * 0.02),
            FirgetPassword(
              press: () {
                Navigator.pushReplacementNamed(context, 'Forgot Password');
              },
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacementNamed(context, 'Sign Up');
              },
            ),
          ],
        ),
      ),
    );
  }
}
