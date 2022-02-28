import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tailor_app_mirwah_mirxa/models/applicationParameter/suitTypeParam.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class AddEditSuitTypePage extends StatefulWidget {
  const AddEditSuitTypePage({Key? key}) : super(key: key);
  @override
  State<AddEditSuitTypePage> createState() => _AddEditSuitTypePageState();
}

class _AddEditSuitTypePageState extends State<AddEditSuitTypePage> {
  bool isRefreshPage = true;

  bool isEdit = false;

  String suitId = "null";
  TextEditingController suitNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController costController = TextEditingController();

  var currentUser;

  final _addEditSuitTypeApi =
      'http://tailorapi.mirwah.com/api/Tailor/SelectSuitTypeParam';

  List<SuitTypeParamModel> suitTypeParamTempList = [];

  getSuitTypeParams() async {
    var res = await storage.read(key: "userCredentials");
    if (res != null) {
      currentUser = jsonDecode(res.toString());

      var response = await http.post(Uri.parse(_addEditSuitTypeApi), body: {
        "nTailorId": currentUser["nTailorId"],
        "nSuitId": suitId,
      });
      if (response.statusCode == 200) {
        setState(() {
          var jsonData = jsonDecode(response.body);
          SuitTypeParamListModel.suitTypeParamArray = List.from(jsonData)
              .map<SuitTypeParamModel>(
                  (type) => SuitTypeParamModel.fromMap(type))
              .toList();

          suitTypeParamTempList = SuitTypeParamListModel.suitTypeParamArray;
          print(response.body);
        });
      }
    }
  }

  @override
  void initState() {
    getSuitTypeParams();

    super.initState();
  }

  final addEditSuitTypeFormKey = GlobalKey<FormState>();
  final _addEditSuitTypeInsertApi =
      'http://tailorapi.mirwah.com/api/Tailor/InsertSuitType';
  final _addEditSuitTypeUpdateApi =
      'http://tailorapi.mirwah.com/api/Tailor/UpdateSuitType';

  final storage = const FlutterSecureStorage();

  bool checkValidation() {
    if (addEditSuitTypeFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void addEditSuitType() async {
    var response;
    if (suitId == "null") {
      response = await http.post(Uri.parse(_addEditSuitTypeInsertApi), body: {
        "nTailorId": currentUser["nTailorId"],
        "nSuitId": "2",
        "sSuitType": suitNameController.text,
        "nPrice": priceController.text,
        "nCost": costController.text,
        "bActive": "true",
      });
    } else {
      response = await http.post(Uri.parse(_addEditSuitTypeUpdateApi), body: {
        "nTailorId": currentUser["nTailorId"],
        "nSuitId": suitId,
        "sSuitType": suitNameController.text,
        "nPrice": priceController.text,
        "nCost": costController.text,
        "bActive": "true",
      });
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: "Suit Type added/updated".text.make()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isRefreshPage) {
      setState(() {
        var arg = ModalRoute.of(context)!.settings.arguments;
        if (arg != null) {
          isRefreshPage = false;
          var data = arg as Map;
          suitId = data["suitId"];
          if (suitId != "null") {
            suitNameController.text = data["suitName"];
            priceController.text = data["price"];
            costController.text = data["cost"];
            print("SuitId ${data['suitId']}");
          }
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: "Add/Edit Suit Type: ${suitNameController.text}".text.make(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: addEditSuitTypeFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: suitNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Enter Suit Name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Suit Name *",
                  ),
                ),
                TextFormField(
                  controller: priceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Enter Price";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Price *",
                  ),
                ),
                TextFormField(
                  controller: costController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Enter Cost";
                    }
                    return null;
                  },
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
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRoutes.addParameterRoute,
                              arguments: {
                                "suitId": suitId,
                                "suitName": suitNameController.text.toString(),
                                "paramId": "null"
                              });
                        },
                        icon: Icon(Icons.add),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),

                if (suitTypeParamTempList.isNotEmpty)
                  Column(children: [
                    Table(
                      border: TableBorder.all(width: 1),
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(color: Colors.amber),
                          children: [
                            TableCell(
                              child: "Parameter".text.bold.make(),
                            ),
                            TableCell(
                              child: "Data Type".text.bold.make(),
                            ),
                            TableCell(
                              child: "Limit".text.bold.make(),
                            ),
                            TableCell(
                              child: "Req.".text.bold.make(),
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
                      children: suitTypeParamTempList.map((s) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: s.sParamName.text.make(),
                            ),
                            TableCell(
                              child: s.sDataType.text.make(),
                            ),
                            TableCell(
                              child: "${s.nLowLimit} - ${s.nHighLimit}"
                                  .text
                                  .make(),
                            ),
                            TableCell(
                              child: Switch(
                                  onChanged: (val) {
                                    // setState(() {
                                    //   isEdit = val;
                                    // });
                                  },
                                  value: s.bRequired.toString().toLowerCase() ==
                                          "true"
                                      ? true
                                      : false),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () {
                                  print(s.nSuitId);
                                  print(suitNameController.text);
                                  Navigator.pushNamed(
                                      context, MyRoutes.addParameterRoute,
                                      arguments: {
                                        "suitId": s.nSuitId,
                                        "suitName":
                                            suitNameController.text.toString(),
                                        "paramId": s.nParamId.toString(),
                                      });
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
                                  child: "Parameter".text.bold.make(),
                                ),
                                TableCell(
                                  child: "Data Type".text.bold.make(),
                                ),
                                TableCell(
                                  child: "Limit".text.bold.make(),
                                ),
                                TableCell(
                                  child: "Req.".text.bold.make(),
                                ),
                                TableCell(
                                  child: "Action".text.bold.make(),
                                ),
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
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "Parameter"
                //                 .text
                //                 .bold
                //                 .textStyle(const TextStyle(fontSize: 11))
                //                 .make(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "Data Type"
                //                 .text
                //                 .bold
                //                 .textStyle(const TextStyle(fontSize: 11))
                //                 .make(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "Limit"
                //                 .text
                //                 .bold
                //                 .textStyle(const TextStyle(fontSize: 11))
                //                 .make(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "Req."
                //                 .text
                //                 .bold
                //                 .textStyle(const TextStyle(fontSize: 11))
                //                 .make(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "Action"
                //                 .text
                //                 .bold
                //                 .textStyle(const TextStyle(fontSize: 11))
                //                 .make(),
                //           ),
                //         ),
                //       ],
                //     ),
                //     TableRow(
                //       children: [
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "Sleeve Length"
                //                 .text
                //                 .textStyle(const TextStyle(fontSize: 11))
                //                 .make(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child:
                //                 "num".text.textStyle(const TextStyle()).make(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "10-15"
                //                 .text
                //                 .textStyle(const TextStyle())
                //                 .make(),
                //           ),
                //         ),
                //         TableCell(
                //           child: Padding(
                //               padding: const EdgeInsets.all(10),
                //               child: Switch(
                //                 onChanged: (val) {
                //                   setState(() {
                //                     isEdit = val;
                //                   });
                //                 },
                //                 value: isEdit,
                //               )),
                //         ),
                //         TableCell(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: "Edit"
                //                 .text
                //                 .bold
                //                 .textStyle(const TextStyle())
                //                 .make(),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (checkValidation()) {
                        addEditSuitType();
                      }
                    },
                    child: "Add".text.make())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
