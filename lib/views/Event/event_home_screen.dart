import 'package:campus_gather/views/Navigation/app_bar.dart';
import 'package:campus_gather/views/Navigation/drawer.dart';
import 'package:flutter/material.dart';
import 'tab_screen.dart';

class EventHomeScreen extends StatelessWidget {
  const EventHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: const CustomDrawer(),
      body: const TabScreen(),
    );
  }
}
