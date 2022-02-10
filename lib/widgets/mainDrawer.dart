import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: 'Mirxa Xayn'.text.make(),
            accountEmail: 'mirxa.xayn@gmail.com'.text.make(),
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
          ),
          ListTile(
            title: "Reports".text.make(),
          ),
        ],
      ),
    );
  }
}
