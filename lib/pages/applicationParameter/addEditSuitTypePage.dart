import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddEditSuitTypePage extends StatefulWidget {
  const AddEditSuitTypePage({Key? key}) : super(key: key);

  @override
  State<AddEditSuitTypePage> createState() => _AddEditSuitTypePageState();
}

class _AddEditSuitTypePageState extends State<AddEditSuitTypePage> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add/Edit Suit Type: Shirt".text.make(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Suit Name *",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Price *",
                ),
              ),
              TextFormField(
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
                      onPressed: () {},
                      icon: Icon(Icons.add),
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
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.amberAccent,
                    ),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "Parameter"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 11))
                              .make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "Data Type"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 11))
                              .make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "Limit"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 11))
                              .make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "Req."
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 11))
                              .make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "Action"
                              .text
                              .bold
                              .textStyle(const TextStyle(fontSize: 11))
                              .make(),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "Sleeve Length"
                              .text
                              .textStyle(const TextStyle(fontSize: 11))
                              .make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "num".text.textStyle(const TextStyle()).make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child:
                              "10-15".text.textStyle(const TextStyle()).make(),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Switch(
                              onChanged: (val) {
                                setState(() {
                                  isEdit = val;
                                });
                              },
                              value: isEdit,
                            )),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: "Edit"
                              .text
                              .bold
                              .textStyle(const TextStyle())
                              .make(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
