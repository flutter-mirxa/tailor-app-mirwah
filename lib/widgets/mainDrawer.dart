import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final storage = const FlutterSecureStorage();

  String currentUserName = "";
  String currentUserEmail = "";

  getCurrentUserCredentials() async {
    var currentUser = await storage.read(key: "userCredentials");
    var data = jsonDecode(currentUser.toString());
    setState(() {
      currentUserEmail = data["sEmail"];
      currentUserName = data["sContactName"];
    });
  }

  @override
  void initState() {
    getCurrentUserCredentials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: currentUserName.text.make(),
            accountEmail: currentUserEmail.text.make(),
            currentAccountPicture: Image.asset('images/avatar.png'),
          ),
          ListTile(
            title: "Application Parameters".text.make(),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.applicationParameterRoute);
            },
          ),
          ListTile(
            title: "Customer".text.make(),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.customersRoute);
            },
          ),
          ListTile(
            title: "Reports".text.make(),
          ),
        ],
      ),
    );
  }
}
