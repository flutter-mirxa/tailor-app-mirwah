import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/addEditSuitTypePage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/addParameterPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/applicationParameterPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/customer/addEditCustomerPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/customer/addEditCustomerSuit.dart';
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
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.registerRoute: (context) => const RegisterPage(),
        MyRoutes.forgotPasswordRoute: (context) => const ForgotPasswordPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.applicationParameterRoute: (context) =>
            const ApplicationParameterPage(),
        MyRoutes.addEditSuitTypeRoute: (context) => const AddEditSuitTypePage(),
        MyRoutes.addParameterRoute: (context) => const AddParameterPage(),
        MyRoutes.customersRoute: (context) => const CustomersPage(),
        MyRoutes.addEditCustomerRoute: (context) => const AddEditCustomerPage(),
        MyRoutes.addEditCustomerSuitRoute: (context) =>
            const AddEditCustomerSuitPage(),
      },
    );
  }
}
