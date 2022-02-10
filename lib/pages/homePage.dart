import 'package:flutter/material.dart';
import 'package:tailor_app_mirwah_mirxa/widgets/mainDrawer.dart';
import 'package:tailor_app_mirwah_mirxa/widgets/mainFloatingButton.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Tailor App".text.make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mail),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.power_settings_new),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: const MainFloatingButton(),
      drawer: const MainDrawer(),
    );
  }
}
