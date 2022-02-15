import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordShow = false;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  final _loginAuthApi =
      'http://tailorapi.mirwah.com/api/Authenticate/Authenticate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            "Tailor App".text.bold.xl5.make().positioned(
                  top: 150.0,
                ),
            Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width - 50.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Icon(
                              Icons.person_rounded,
                              size: 40.0,
                            ),
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: userIdController,
                            onChanged: (val) {},
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter user id first!";
                              } else if (val.length < 4) {
                                return "UserId should be atleast 4 characters";
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "User Id",
                            ),
                          ).expand()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Icon(
                              Icons.lock_sharp,
                              size: 40.0,
                            ),
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: passwordController,
                            onChanged: (val) {},
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter password first!";
                              } else if (val.length < 4) {
                                return "Password should be atleast 4 characters";
                              } else {
                                return null;
                              }
                            },
                            obscureText: !isPasswordShow,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordShow = !isPasswordShow;
                                  });
                                },
                                icon: Icon(isPasswordShow
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              border: const UnderlineInputBorder(),
                              labelText: "Password",
                            ),
                          ).expand()
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.forgotPasswordRoute);
                              },
                              child: "Forgot Password ?"
                                  .text
                                  .underline
                                  .color(Colors.blueAccent)
                                  .make(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (userValidation()) {
                                Navigator.pushReplacementNamed(
                                    context, MyRoutes.homeRoute);
                              }
                            },
                            child: "Login".text.make(),
                          )
                        ],
                      )
                    ],
                  ),
                )).positioned(
              top: 230.0,
            ),
            Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width - 50.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: "Sign Up:".text.bold.make(),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRoutes.registerRoute);
                          },
                          child: "Register as Tailor"
                              .text
                              .underline
                              .color(Colors.blueAccent)
                              .make(),
                        )
                      ],
                    ),
                  ],
                )).positioned(
              top: 470.0,
            ),
            // Positioned(

            //     left: 50,
            //     top: 172,
            //     child: Container(
            //       padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            //       color: Colors.white,
            //       child: Text(
            //         'Create an account',
            //         style: TextStyle(color: Colors.black, fontSize: 12),
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }

  bool userValidation() {
    if (_loginFormKey.currentState!.validate()) {
      checkUserAuthentication();
    }
    return false;
  }

  checkUserAuthentication() async {
    var response = await http.post(Uri.parse(_loginAuthApi), body: {
      "user_name": "124",
      "password": passwordController.text,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
    }
  }
}
