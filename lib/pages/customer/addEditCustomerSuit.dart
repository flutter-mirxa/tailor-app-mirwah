import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddEditCustomerSuitPage extends StatefulWidget {
  const AddEditCustomerSuitPage({Key? key}) : super(key: key);

  @override
  _AddEditCustomerSuitPageState createState() =>
      _AddEditCustomerSuitPageState();
}

class _AddEditCustomerSuitPageState extends State<AddEditCustomerSuitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Mirxa - Shirt".text.make(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 20.0,
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                Row(
                  children: [
                    "Sleeve".text.make(),
                    SizedBox(
                      width: 20.0,
                    ),
                    TextFormField().expand()
                  ],
                ),
                Row(
                  children: [
                    "Height".text.make(),
                    SizedBox(
                      width: 20.0,
                    ),
                    TextFormField().expand()
                  ],
                ),
                Row(
                  children: [
                    "Sleeve".text.make(),
                    SizedBox(
                      width: 20.0,
                    ),
                    TextFormField().expand()
                  ],
                ),
                Row(
                  children: [
                    "Height".text.make(),
                    SizedBox(
                      width: 20.0,
                    ),
                    TextFormField().expand()
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: "Add/Update".text.make())
                  ],
                )
              ],
            ),
          ).positioned(top: 20.0),
          "Shirt Sizes"
              .text
              .bold
              .textStyle(TextStyle(backgroundColor: Colors.white))
              .make()
              .positioned(top: 10, left: 25),
        ],
      ),
    );
  }
}
