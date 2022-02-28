import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class AddParameterPage extends StatefulWidget {
  const AddParameterPage({Key? key}) : super(key: key);

  @override
  _AddParameterPageState createState() => _AddParameterPageState();
}

class _AddParameterPageState extends State<AddParameterPage> {
  bool isRefreshPage = true;

  bool isFieldRequired = false;

  TextEditingController nameController = TextEditingController();
  String? selectedParameter = "numeric";
  TextEditingController lowLimitController = TextEditingController();
  TextEditingController highLimitController = TextEditingController();

  final _addParameterFormKey = GlobalKey<FormState>();

  final _addUpdateParameterInsertApi =
      'http://tailorapi.mirwah.com/api/Tailor/InsertSuitTypeParam';
  final _addUpdateParameterUpdateApi =
      'http://tailorapi.mirwah.com/api/Tailor/UpdateSuitTypeParam';

  final _addUpdateParameterSelectApi =
      'http://tailorapi.mirwah.com/api/Tailor/SelectSuitTypeParamSelected';

  final storage = const FlutterSecureStorage();

  var currentUser;
  String suitId = "null", suitName = "", paramId = "null";

  getSelectSuitTypeParameter() async {
    if (currentUser == null) {
      await getCurrentUser();
    }
    var response = await http.post(Uri.parse(_addUpdateParameterSelectApi),
        body: {
          "nTailorId": currentUser["nTailorId"],
          "nSuitId": suitId,
          "nParamId": paramId
        });
    if (response.statusCode == 200) {
      setState(() {
        var jsonData = jsonDecode(response.body);
        paramId = jsonData["nParamId"];
        nameController.text = jsonData["sParamName"];
        selectedParameter = jsonData["sDataType"];
        if (selectedParameter == "numeric") {
          lowLimitController.text = jsonData["nLowLimit"];
          highLimitController.text = jsonData["nHighLimit"];
          isFieldRequired =
              jsonData['bRequired'].toString() == "True" ? true : false;
        }

        print(jsonData);
      });
    }
  }

  getCurrentUser() async {
    var res = await storage.read(key: "userCredentials");
    currentUser = jsonDecode(res.toString());
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  bool checkValidation() {
    if (_addParameterFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void addUpdateParameter() async {
    var response, msg = "";
    if (paramId == "null") {
      response =
          await http.post(Uri.parse(_addUpdateParameterInsertApi), body: {
        "nTailorId": currentUser["nTailorId"],
        "nSuitId": suitId,
        "nParamId": "0",
        "sParamName": nameController.text,
        "sDataType": selectedParameter,
        "nLowLimit":
            selectedParameter == "numeric" ? lowLimitController.text : "0",
        "nHighLimit":
            selectedParameter == "numeric" ? highLimitController.text : "0",
        "bRequired": isFieldRequired.toString(),
      });
      msg = "Parameter addedd";
    } else {
      response =
          await http.post(Uri.parse(_addUpdateParameterUpdateApi), body: {
        "nTailorId": currentUser["nTailorId"],
        "nSuitId": suitId,
        "nParamId": paramId,
        "sParamName": nameController.text,
        "sDataType": selectedParameter,
        "nLowLimit":
            selectedParameter == "numeric" ? lowLimitController.text : "0",
        "nHighLimit":
            selectedParameter == "numeric" ? highLimitController.text : "0",
        "bRequired": isFieldRequired.toString(),
      });
      msg = "Parameter updated";
    }

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: msg.text.make()));

      Navigator.pop(context);
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
            suitName = data["suitName"];
            if (data["paramId"] != "null") {
              paramId = data["paramId"];
              getSelectSuitTypeParameter();
            }

            print("SuitId ${data['suitId']}");
          }
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: "$suitName > Parameter".text.bold.make(),
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
            child: Form(
              key: _addParameterFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val.isEmptyOrNull) {
                        return "Enter Name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Name *",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Data Type".text.make(),
                      const SizedBox(
                        width: 60.0,
                      ),
                      DropdownButtonFormField(
                        value: selectedParameter,
                        items: <String>["Numeric", "Alpha", "Boolean"]
                            .map<DropdownMenuItem<String>>((String val) {
                          return DropdownMenuItem<String>(
                            value: val.toLowerCase(),
                            child: val.text.make(),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedParameter = newValue;
                          });
                        },
                      ).w32(context),
                    ],
                  ),
                  selectedParameter == "numeric"
                      ? TextFormField(
                          controller: lowLimitController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val.isEmptyOrNull) {
                              return "Enter Low Limit";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Low Limit *",
                          ),
                        )
                      : const SizedBox(height: 0),
                  selectedParameter == "numeric"
                      ? TextFormField(
                          controller: highLimitController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val.isEmptyOrNull) {
                              return "Enter High Limit";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "High Limit *",
                          ),
                        )
                      : const SizedBox(height: 0),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      "Field Required".text.make(),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Switch(
                        value: isFieldRequired,
                        onChanged: (val) {
                          setState(() {
                            isFieldRequired = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (checkValidation()) {
                            addUpdateParameter();
                          }
                        },
                        child: "Add/Update".text.make(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ).positioned(top: 40),
          "Parameters"
              .text
              .bold
              .textStyle(const TextStyle(
                backgroundColor: Colors.white,
              ))
              .make()
              .positioned(
                top: 30,
                left: 25,
              ),
        ],
      ),
    );
  }
}
