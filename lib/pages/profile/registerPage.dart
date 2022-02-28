import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPasswordShow = false;
  bool isConfirmPasswordShow = false;
  bool isAcceptTermCondition = false;

  final _registerFormKey = GlobalKey<FormState>();
  final _newUserRegistrationApi =
      'http://tailorapi.mirwah.com/api/Tailor/RegisterTailor';

  TextEditingController businessNameController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Tailor Registeration".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _registerFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: businessNameController,
                decoration: const InputDecoration(
                  hintText: "Business Name *",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter business name";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: contactNameController,
                decoration: const InputDecoration(
                  hintText: "Contact Name *",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter contact name";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email *",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter email";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: mobileNoController,
                decoration: const InputDecoration(
                  hintText: "Mobile No *",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter mobile no";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: userIdController,
                decoration: const InputDecoration(
                  hintText: "User Id",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter user id";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: !isPasswordShow,
                decoration: InputDecoration(
                  hintText: "Password",
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
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: !isConfirmPasswordShow,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordShow = !isConfirmPasswordShow;
                      });
                    },
                    icon: Icon(isConfirmPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter password";
                  } else if (val != passwordController.text) {
                    return "Password does not match";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isAcceptTermCondition,
                    onChanged: (val) {
                      setState(() {
                        isAcceptTermCondition = !isAcceptTermCondition;
                      });
                    },
                  ),
                  "I agree with terms & conditions".text.make(),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: userValidation,
                    child: "Register".text.make(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void userValidation() {
    if (_registerFormKey.currentState!.validate() && isAcceptTermCondition) {
      newUserRegistration();
    }
  }

  void newUserRegistration() async {
    var response = await http.post(Uri.parse(_newUserRegistrationApi), body: {
      "sBusinessName": businessNameController.text,
      "sContactName": contactNameController.text,
      "sEmail": emailController.text,
      "sMobileNo": mobileNoController.text,
      "sUserId": userIdController.text,
      "sPassword": passwordController.text,
      "bActive": "true"
    });

    Navigator.pushNamedAndRemoveUntil(
        context, MyRoutes.loginRoute, (route) => false);
  }
}
