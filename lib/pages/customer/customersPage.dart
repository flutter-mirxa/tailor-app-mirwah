import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

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
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRoutes.addEditCustomerRoute);
                        },
                        tooltip: "Add Customer",
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
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.amberAccent,
                      ),
                      children: [
                        TableCell(
                          child: "Code"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 9))
                              .make()
                              .centered(),
                        ),
                        TableCell(
                          child: "Name"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 9))
                              .make()
                              .centered(),
                        ),
                        TableCell(
                          child: "Email"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 9))
                              .make()
                              .centered(),
                        ),
                        TableCell(
                          child: "Mobile No"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 3))
                              .make()
                              .centered(),
                        ),
                        TableCell(
                          child: "Action"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 9))
                              .make()
                              .centered(),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: "101"
                                .text
                                .textStyle(TextStyle(fontSize: 9))
                                .make()
                                .centered(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: "Kamran Ali"
                                .text
                                .textStyle(TextStyle(fontSize: 9))
                                .make(),
                          ),
                        ),
                        TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: "Kam@gmail.com"
                              .text
                              .textStyle(TextStyle(fontSize: 9))
                              .make(),
                        )),
                        TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: "0312-1212121"
                              .text
                              .textStyle(TextStyle(fontSize: 4))
                              .make(),
                        )),
                        TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: "Edit"
                              .text
                              .bold
                              .textStyle(TextStyle(fontSize: 9))
                              .make()
                              .centered(),
                        )),
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
