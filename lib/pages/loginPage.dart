import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordShow = false;

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
                          onPressed: () {},
                          child: "Login".text.make(),
                        )
                      ],
                    )
                  ],
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
                        "Register as Tailor"
                            .text
                            .underline
                            .color(Colors.blueAccent)
                            .make(),
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
}
