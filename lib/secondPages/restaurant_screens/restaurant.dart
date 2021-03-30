import 'package:GRSON/secondPages/widgets/res-drawer.dart';
import 'package:flutter/material.dart';
import 'package:GRSON/secondpages/theme/Theme.dart';
import 'My_Restaurant/myOperations.dart';
import 'My_Restaurant/myRestaurantHome.dart';

class Restaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Restaurant",
              ),
              elevation: 30,
              brightness: Brightness.dark,
              bottom: TabBar(indicatorColor: Colors.white, tabs: [
                Tab(
                  child: Text(
                    "My Restaurant",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Operations",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
              ]),
            ),
            backgroundColor: ArgonColors.bgColorScreen,
            drawer: ResDrawer(
              currentPage: "Home",
            ),
            body: TabBarView(
              children: [
                RestaurantHome(),
                Operations(),
              ],
            )));
  }
}
