import 'package:GRSON/secondPages/customer_screens/Take%20Away/Widgets/ItemDivider.dart';
import 'package:GRSON/secondPages/theme/Theme.dart';
import 'package:GRSON/welcomePages/constants.dart';
import 'package:flutter/material.dart';

import 'Widgets/TakeAwayItem.dart';

class TakeAwayAccepet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyBody();
}

class _MyBody extends State<TakeAwayAccepet> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 24.0, right: 24.0, bottom: 32),
              child: Card(
                  elevation: 9,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: [
                      TakeAwayItem(),
                      ItemDivider(),
                      TakeAwayItem(),
                    ],
                  )),
            ),
          ]),
        ));
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 25),
        onPressed: () {
          Navigator.pushReplacementNamed(context, "Restaurant");
        },
      ),
      title: Text(
        "Take away",
      ),
      elevation: 30,
      brightness: Brightness.dark,
    );
  }
}
