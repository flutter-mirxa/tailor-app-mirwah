import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:tailor_app_mirwah_mirxa/widgets/home/notification.dart';
import 'package:tailor_app_mirwah_mirxa/widgets/mainDrawer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isUnreadNotif = true;
  bool isHomePageShow = true;

  final storage = const FlutterSecureStorage();

  isAlreadyLoggedIn() async {
    var isCurrentUser = await storage.read(key: "userCredentials");
    if (isCurrentUser != null) {
      return true;
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, MyRoutes.loginRoute, (route) => false);
      return false;
    }
  }

  @override
  void initState() {
    isAlreadyLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var notifScaffold = Scaffold(
      appBar: AppBar(
        title: "Tailor App".text.make(),
        actions: [
          isUnreadNotif
              ? Badge(
                  position: BadgePosition.topEnd(top: 2, end: 2),
                  badgeContent: "1".text.color(Colors.white).make(),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isHomePageShow = !isHomePageShow;
                      });
                    },
                    icon: const Icon(Icons.mail),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isHomePageShow = !isHomePageShow;
                    });
                  },
                  icon: const Icon(Icons.mail),
                ),
          IconButton(
            tooltip: "Sign Out",
            onPressed: () {
              storage.deleteAll();
              Navigator.pushNamedAndRemoveUntil(
                  context, MyRoutes.loginRoute, (route) => false);
            },
            icon: const Icon(Icons.power_settings_new),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "New Customer",
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_alarm_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Notices".text.xl4.bold.make(),
            SizedBox(
              height: 20.0,
            ),
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return HomeNotification();
              },
            ).expand(),
          ],
        ),
      ),
    );

    var homeScaffold = Scaffold(
      appBar: AppBar(
        title: "Tailor App".text.make(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isHomePageShow = !isHomePageShow;
              });
            },
            icon: const Icon(Icons.mail),
          ),
          IconButton(
            tooltip: "Sign Out",
            onPressed: () {
              storage.deleteAll();
              Navigator.pushNamedAndRemoveUntil(
                  context, MyRoutes.loginRoute, (route) => false);
            },
            icon: const Icon(Icons.power_settings_new),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "New Customer",
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.addEditCustomerRoute);
            },
            icon: const Icon(
              Icons.person_add,
              color: Colors.black,
            ),
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
    return isHomePageShow ? homeScaffold : notifScaffold;
  }
}
