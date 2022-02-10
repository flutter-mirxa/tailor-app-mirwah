import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/pages/applicationParameterPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/forgotPasswordPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/homePage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/loginPage.dart';
import 'package:tailor_app_mirwah_mirxa/pages/registerPage.dart';
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
        MyRoutes.addEditSuitTypeRoute: (context) => const AddEditSuitTypePage()
      },
    );
  }
}

class AddEditSuitTypePage extends StatefulWidget {
  const AddEditSuitTypePage({Key? key}) : super(key: key);

  @override
  State<AddEditSuitTypePage> createState() => _AddEditSuitTypePageState();
}

class _AddEditSuitTypePageState extends State<AddEditSuitTypePage> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add/Edit Suit Type: Shirt".text.make(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Suit Name *",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Price *",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Cost *",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
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
                  0: FlexColumnWidth(100),
                  1: FlexColumnWidth(100),
                  2: FlexColumnWidth(70),
                  3: FlexColumnWidth(100),
                  4: FlexColumnWidth(100),
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
                          child: "Required"
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
                          child: "num".text.textStyle(const TextStyle()).make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child:
                              "10-15".text.textStyle(const TextStyle()).make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Switch(
                              onChanged: (val) {
                                setState(() {
                                  isEdit = val;
                                });
                              },
                              value: isEdit,
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
        ),
      ),
    );
  }
}
