import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/addEditSuitTypePage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/addParameterPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameter/applicationParameterPage.dart';
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
        "/": (context) => const RegisterPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.registerRoute: (context) => const RegisterPage(),
        MyRoutes.forgotPasswordRoute: (context) => const ForgotPasswordPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.applicationParameterRoute: (context) =>
            const ApplicationParameterPage(),
        MyRoutes.addEditSuitTypeRoute: (context) => const AddEditSuitTypePage(),
        MyRoutes.addParameterRoute: (context) => const AddParameterPage()
      },
    );
  }
}

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Customers".text.make(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        hintText: "search",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ).w64(context),
                    CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Table(
                  border: TableBorder.all(width: 1),
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.amberAccent,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Parameter"
                                .text
                                .bold
                                .textStyle(const TextStyle(fontSize: 11))
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Data Type"
                                .text
                                .bold
                                .textStyle(const TextStyle(fontSize: 11))
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Limit"
                                .text
                                .bold
                                .textStyle(const TextStyle(fontSize: 11))
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Req."
                                .text
                                .bold
                                .textStyle(const TextStyle(fontSize: 11))
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Action"
                                .text
                                .bold
                                .textStyle(const TextStyle(fontSize: 11))
                                .make(),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Sleeve Length"
                                .text
                                .textStyle(const TextStyle(fontSize: 11))
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                "num".text.textStyle(const TextStyle()).make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "10-15"
                                .text
                                .textStyle(const TextStyle())
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Switch(
                                onChanged: (val) {
                                  setState(() {
                                    //  isEdit = val;
                                  });
                                },
                                value: false,
                              )),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Edit"
                                .text
                                .bold
                                .textStyle(const TextStyle())
                                .make(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ).positioned(top: 20),
          "Register Customers List"
              .text
              .bold
              .textStyle(const TextStyle(backgroundColor: Colors.white))
              .make()
              .positioned(top: 10, left: 20),
        ],
      ),
    );
  }
}
