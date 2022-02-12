import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddParameterPage extends StatefulWidget {
  const AddParameterPage({Key? key}) : super(key: key);

  @override
  _AddParameterPageState createState() => _AddParameterPageState();
}

class _AddParameterPageState extends State<AddParameterPage> {
  String? selectedParameter = "numeric";
  bool isFieldRequired = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Shirt > Parameter".text.bold.make(),
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
                TextFormField(
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
                        decoration: const InputDecoration(
                          hintText: "Low Limit *",
                        ),
                      )
                    : const SizedBox(height: 0),
                selectedParameter == "numeric"
                    ? TextFormField(
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
                      onPressed: () {},
                      child: "Add/Update".text.make(),
                    ),
                  ],
                )
              ],
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
