import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPasswordShow = false;
  bool isConfirmPasswordShow = false;
  bool isAcceptTermCondition = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Tailor Registeration".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Business Name *",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Contact Name *",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email *",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Mobile No *",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "User Id",
              ),
            ),
            TextFormField(
              obscureText: !isPasswordShow,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordShow = !isPasswordShow;
                    });
                  },
                  icon: Icon(
                      isPasswordShow ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            TextFormField(
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
                  onPressed: () {},
                  child: "Register".text.make(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
