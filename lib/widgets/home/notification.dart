import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeNotification extends StatefulWidget {
  const HomeNotification({Key? key}) : super(key: key);

  @override
  _HomeNotificationState createState() => _HomeNotificationState();
}

class _HomeNotificationState extends State<HomeNotification> {
  bool? isRead = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateFormat("MMM dd, yyyy h:mm a")
                        .format(DateTime.now())
                        .text
                        .bold
                        .make(),
                    Row(
                      children: [
                        Checkbox(
                            value: isRead,
                            onChanged: (val) {
                              if (isRead != null && isRead == false) {
                                setState(() {
                                  isRead = val;
                                });
                              }
                            }),
                        isRead != null && isRead == true
                            ? "Read".text.make()
                            : "Unread".text.make(),
                      ],
                    )
                  ],
                ),
                "Kamran is registered as customer".text.bold.make(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
