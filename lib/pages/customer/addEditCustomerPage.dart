import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tailor_app_mirwah_mirxa/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddEditCustomerPage extends StatefulWidget {
  const AddEditCustomerPage({Key? key}) : super(key: key);

  @override
  _AddEditCustomerPageState createState() => _AddEditCustomerPageState();
}

class _AddEditCustomerPageState extends State<AddEditCustomerPage> {
  TextEditingController registrationDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add/Edit Customer".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'images/avatar.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Code",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Register Via".text.make(),
                Row(
                  children: [
                    Radio(value: 1, groupValue: 1, onChanged: (val) {}),
                    "Email Address".text.make(),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 2, groupValue: 1, onChanged: (val) {}),
                    "Mobile No.".text.make(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email Address",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Mobile No.",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                "Registeration Date".text.make(),
                const SizedBox(
                  width: 20.0,
                ),
                TextFormField(
                  readOnly: true,
                  controller: registrationDateController,
                  decoration: const InputDecoration(
                    hintText: "dd/mm/yyyy",
                    border: OutlineInputBorder(),
                  ),
                ).w32(context),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    _selectedDate(context);
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, MyRoutes.addEditCustomerSuitRoute);
                    },
                    icon: Icon(Icons.add),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Table(
              border: TableBorder.all(width: 1),
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
              },
              children: [
                TableRow(children: [
                  TableCell(
                    child: "Suit Type".text.bold.make().centered(),
                  ),
                  TableCell(
                    child: "Action".text.bold.make().centered(),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: "Shirt".text.make(),
                  ),
                  TableCell(
                    child: Row(
                      children: [
                        InkWell(
                          child: "View".text.make(),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 20.0,
                          child: "-".text.bold.make().centered(),
                        ),
                        InkWell(
                          child: "Edit".text.make(),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 20.0,
                          child: "-".text.bold.make().centered(),
                        ),
                        InkWell(
                          child: "Remove".text.make(),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: "Pent".text.make(),
                  ),
                  TableCell(
                    child: Row(
                      children: [
                        InkWell(
                          child: "View".text.make(),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 20.0,
                          child: "-".text.bold.make().centered(),
                        ),
                        InkWell(
                          child: "Edit".text.make(),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 20.0,
                          child: "-".text.bold.make().centered(),
                        ),
                        InkWell(
                          child: "Remove".text.make(),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }

  _selectedDate(BuildContext context) async {
    final DateTime? dateTimeSelected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2023));
    if (dateTimeSelected != null && dateTimeSelected != selectedDate) {
      setState(() {
        String convertedDate =
            DateFormat("dd-MM-yyyy").format(dateTimeSelected);
        registrationDateController.text = convertedDate;
      });
    }
  }
}
