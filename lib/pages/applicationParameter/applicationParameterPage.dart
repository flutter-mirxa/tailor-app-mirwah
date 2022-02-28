import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tailor_app_mirwah_mirxa/models/applicationParameter/suitTypes.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class ApplicationParameterPage extends StatefulWidget {
  const ApplicationParameterPage({Key? key}) : super(key: key);

  @override
  State<ApplicationParameterPage> createState() =>
      _ApplicationParameterPageState();
}

class _ApplicationParameterPageState extends State<ApplicationParameterPage> {
  final _applicationParametersApi =
      'http://tailorapi.mirwah.com/api/Tailor/SelectSuitType';

  final storage = const FlutterSecureStorage();

  List<SuitTypeModel> appParamSuitTypeTempList = [];

  TextEditingController searchController = TextEditingController();

  filterList() {
    var searchText = searchController.text;
    if (SuitTypeListModel.suitTypeArray.isNotEmpty) {
      setState(() {
        appParamSuitTypeTempList = SuitTypeListModel.suitTypeArray
            .filter((elem) =>
                elem.sSuitType.toString().toLowerCase().contains(searchText) ||
                elem.nPrice.contains(searchText) ||
                elem.nCost.contains(searchText))
            .toList();
      });
    }
  }

  @override
  void initState() {
    getApplicationParameterSuitTypes();
    super.initState();
  }

  getApplicationParameterSuitTypes() async {
    var res = await storage.read(key: "userCredentials");
    var currentUser = jsonDecode(res.toString());

    var response = await http.post(Uri.parse(_applicationParametersApi), body: {
      "nTailorId": currentUser["nTailorId"],
    });
    if (response.statusCode == 200) {
      setState(() {
        var jsonData = jsonDecode(response.body);
        SuitTypeListModel.suitTypeArray = List.from(jsonData)
            .map<SuitTypeModel>((type) => SuitTypeModel.fromMap(type))
            .toList();

        appParamSuitTypeTempList = SuitTypeListModel.suitTypeArray;
        // print(SuitTypeListModel.suitTypeArray);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Application Parameter".text.make(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRoutes.addEditSuitTypeRoute,
                              arguments: {"suitId": "null"});
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: searchController,
                  onChanged: (val) {
                    filterList();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: "search",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if (appParamSuitTypeTempList.isNotEmpty)
                  Column(children: [
                    Table(
                      border: TableBorder.all(width: 1),
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(color: Colors.amber),
                          children: [
                            TableCell(
                              child: "Suit Type".text.bold.make(),
                            ),
                            TableCell(
                              child: "Price".text.bold.make(),
                            ),
                            TableCell(
                              child: "Cost".text.bold.make(),
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
                      children: appParamSuitTypeTempList.map((s) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: s.sSuitType.text.make(),
                            ),
                            TableCell(
                              child: s.nPrice.text.make(),
                            ),
                            TableCell(
                              child: s.nCost.text.make(),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => {
                                  Navigator.pushNamed(
                                      context, MyRoutes.addEditSuitTypeRoute,
                                      arguments: {
                                        "suitId": s.nSuitId.toString(),
                                        "suitName": s.sSuitType.toString(),
                                        "price": s.nPrice.toString(),
                                        "cost": s.nCost.toString()
                                      })
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
                                  child: "Suit Type".text.bold.make(),
                                ),
                                TableCell(child: "Price".text.bold.make()),
                                TableCell(child: "Cost".text.bold.make()),
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
              ],
            ),
          ).positioned(top: 26),
          "Suit Types"
              .text
              .bold
              .textStyle(
                const TextStyle(
                  backgroundColor: Colors.white,
                ),
              )
              .make()
              .positioned(
                top: 15,
                left: 25,
              ),
        ],
      ),
    );
  }
}
