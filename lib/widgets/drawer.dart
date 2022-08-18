import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:first_app/utils/routes.dart';
import 'package:ionicons/ionicons.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text('Username!'),
                accountEmail: Text('user@email.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar_d.png'),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.HomeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.HomeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.chat_bubble_2_fill,
                color: Colors.white,
              ),
              title: Text(
                'Chats',
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.HomeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.HomeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.graph_square,
                color: Colors.white,
              ),
              title: Text(
                'Vitals',
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.HomeRoute);
              },
            ),
            SizedBox(
              height: 150,
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 110),
              width: 20,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Ionicons.log_out_outline, color: Colors.blue),
              // child: Text(
              //   'Logout',
              //   style: TextStyle(
              //       color: Colors.blue,
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
