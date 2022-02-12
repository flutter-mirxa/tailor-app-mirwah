import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/addEditSuitTypePage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/addParameterPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/applicationParameterPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/customer/customersPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/homePage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/profile/forgotPasswordPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/profile/loginPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/profile/registerPage.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      title: "Tailor App",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        "/": (context) => const AddEditCustomerPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.registerRoute: (context) => const RegisterPage(),
        MyRoutes.forgotPasswordRoute: (context) => const ForgotPasswordPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.applicationParameterRoute: (context) =>
            const ApplicationParameterPage(),
        MyRoutes.addEditSuitTypeRoute: (context) => const AddEditSuitTypePage(),
        MyRoutes.addParameterRoute: (context) => const AddParameterPage(),
        MyRoutes.customersRoute: (context) => const CustomersPage(),
      },
    );
  }
}

class AddEditCustomerPage extends StatefulWidget {
  const AddEditCustomerPage({Key? key}) : super(key: key);

  @override
  _AddEditCustomerPageState createState() => _AddEditCustomerPageState();
}

class _AddEditCustomerPageState extends State<AddEditCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add/Edit Customer".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'images/avatar.png',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Code",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Register Via".text.make(),
                Row(
                  children: [
                    Radio(value: 1, groupValue: 1, onChanged: (val) {}),
                    "Email Address".text.make(),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 2, groupValue: 1, onChanged: (val) {}),
                    "Mobile No.".text.make(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Mobile No.",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                "Registration Date".text.make(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
