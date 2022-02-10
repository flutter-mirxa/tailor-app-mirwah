import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ApplicationParameterPage extends StatefulWidget {
  const ApplicationParameterPage({Key? key}) : super(key: key);

  @override
  State<ApplicationParameterPage> createState() =>
      _ApplicationParameterPageState();
}

class _ApplicationParameterPageState extends State<ApplicationParameterPage> {
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
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
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
                Table(
                  border: TableBorder.all(width: 1),
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.amberAccent,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Suit Type"
                                .text
                                .bold
                                .textStyle(const TextStyle())
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Price"
                                .text
                                .bold
                                .textStyle(const TextStyle())
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Cost"
                                .text
                                .bold
                                .textStyle(const TextStyle())
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Action"
                                .text
                                .bold
                                .textStyle(const TextStyle())
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
                            child: "Shirt"
                                .text
                                .textStyle(const TextStyle())
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                "500".text.textStyle(const TextStyle()).make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                "300".text.textStyle(const TextStyle()).make(),
                          ),
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
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: "Shirt"
                                .text
                                .textStyle(const TextStyle())
                                .make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                "500".text.textStyle(const TextStyle()).make(),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                "300".text.textStyle(const TextStyle()).make(),
                          ),
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
                )
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
