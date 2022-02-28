import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tailor_app_mirwah_mirxa/models/customer/customer.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final storage = const FlutterSecureStorage();

  List<CustomerModel> customerTempList = [];

  final _customerApi =
      'http://tailorapi.mirwah.com/api/Tailor/SelectCustomerAll';

  getCustomerList() async {
    var res = await storage.read(key: "userCredentials");
    var currentUser = jsonDecode(res.toString());

    var response = await http.post(Uri.parse(_customerApi), body: {
      "nTailorId": currentUser["nTailorId"],
    });
    if (response.statusCode == 200) {
      setState(() {
        var jsonData = jsonDecode(response.body);
        CustomerListModel.customerArray = List.from(jsonData)
            .map<CustomerModel>((type) => CustomerModel.fromMap(type))
            .toList();

        customerTempList = CustomerListModel.customerArray;
        print(jsonData);
      });
    }
  }

  TextEditingController searchController = TextEditingController();

  filterList() {
    var searchText = searchController.text;
    if (CustomerListModel.customerArray.isNotEmpty) {
      setState(() {
        customerTempList = CustomerListModel.customerArray
            .filter((elem) =>
                elem.sCustomerCode.contains(searchText) ||
                elem.sCustomerName.contains(searchText) ||
                elem.sEmail.contains(searchText) ||
                elem.sMobileNo.contains(searchText))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCustomerList();
  }

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
                      controller: searchController,
                      onChanged: (val) {
                        filterList();
                      },
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
                if (customerTempList.isNotEmpty)
                  Column(children: [
                    Table(
                      border: TableBorder.all(width: 1),
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(color: Colors.amber),
                          children: [
                            TableCell(
                              child: "Code".text.bold.make(),
                            ),
                            TableCell(
                              child: "Name".text.bold.make(),
                            ),
                            TableCell(
                              child: "Email".text.bold.make(),
                            ),
                            TableCell(
                              child: "Mob No".text.bold.make(),
                            ),
                            TableCell(
                              child: "Action".text.bold.make(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Table(
                      border: TableBorder.all(width: 1),
                      children: customerTempList.map((s) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: s.sCustomerCode.text.make(),
                            ),
                            TableCell(
                              child: s.sCustomerName.text.make(),
                            ),
                            TableCell(
                              child: s.sEmail.text.make(),
                            ),
                            TableCell(
                              child: s.sMobileNo.text.make(),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => {
                                  // Navigator.pushNamed(
                                  //     context, MyRoutes.addEditSuitTypeRoute,
                                  //     arguments: {
                                  //       "suitId": s.nSuitId.toString(),
                                  //       "suitName": s.sSuitType.toString(),
                                  //       "price": s.nPrice.toString(),
                                  //       "cost": s.nCost.toString()
                                  //     })
                                },
                                child: "Edit".text.bold.make(),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    )
                  ])
                else
                  Column(
                    children: [
                      Table(
                        border: TableBorder.all(width: 1),
                        children: [
                          TableRow(
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                              children: [
                                TableCell(
                                  child: "Code".text.bold.make(),
                                ),
                                TableCell(child: "Name".text.bold.make()),
                                TableCell(child: "Email".text.bold.make()),
                                TableCell(child: "Mob No".text.bold.make()),
                                TableCell(child: "Action".text.bold.make()),
                              ])
                        ],
                      ),
                      Table(
                        border: TableBorder.all(width: 1),
                        children: [
                          TableRow(children: [
                            TableCell(
                              child: "No Record Found!"
                                  .text
                                  .bold
                                  .make()
                                  .py12()
                                  .centered(),
                            ),
                          ])
                        ],
                      )
                    ],
                  ),
                // Table(
                //   border: TableBorder.all(width: 1),
                //   children: [
                //     TableRow(
                //       decoration: const BoxDecoration(
                //         color: Colors.amberAccent,
                //       ),
                //       children: [
                //         TableCell(
                //           child: "Code"
                //               .text
                //               .bold
                //               .textStyle(const TextStyle(fontSize: 9))
                //               .make()
                //               .centered(),
                //         ),
                //         TableCell(
                //           child: "Name"
                //               .text
                //               .bold
                //               .textStyle(const TextStyle(fontSize: 9))
                //               .make()
                //               .centered(),
                //         ),
                //         TableCell(
                //           child: "Email"
                //               .text
                //               .bold
                //               .textStyle(const TextStyle(fontSize: 9))
                //               .make()
                //               .centered(),
                //         ),
                //         TableCell(
                //           child: "Mobile No"
                //               .text
                //               .bold
                //               .textStyle(const TextStyle(fontSize: 3))
                //               .make()
                //               .centered(),
                //         ),
                //         TableCell(
                //           child: "Action"
                //               .text
                //               .bold
                //               .textStyle(const TextStyle(fontSize: 9))
                //               .make()
                //               .centered(),
                //         ),
                //       ],
                //     ),
                //     TableRow(
                //       children: [
                //         TableCell(
                //           child: Padding(
                //             padding: EdgeInsets.all(5),
                //             child: "101"
                //                 .text
                //                 .textStyle(TextStyle(fontSize: 9))
                //                 .make()
                //                 .centered(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: EdgeInsets.all(5),
                //             child: "Kamran Ali"
                //                 .text
                //                 .textStyle(TextStyle(fontSize: 9))
                //                 .make(),
                //           ),
                //         ),
                //         TableCell(
                //             child: Padding(
                //           padding: EdgeInsets.all(5),
                //           child: "Kam@gmail.com"
                //               .text
                //               .textStyle(TextStyle(fontSize: 9))
                //               .make(),
                //         )),
                //         TableCell(
                //             child: Padding(
                //           padding: EdgeInsets.all(5),
                //           child: "0312-1212121"
                //               .text
                //               .textStyle(TextStyle(fontSize: 4))
                //               .make(),
                //         )),
                //         TableCell(
                //             child: Padding(
                //           padding: EdgeInsets.all(5),
                //           child: "Edit"
                //               .text
                //               .bold
                //               .textStyle(TextStyle(fontSize: 9))
                //               .make()
                //               .centered(),
                //         )),
                //       ],
                //     ),
                //   ],
                // ),
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
