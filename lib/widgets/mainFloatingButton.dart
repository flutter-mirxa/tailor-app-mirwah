import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MainFloatingButton extends StatelessWidget {
  const MainFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: "New Customer",
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
