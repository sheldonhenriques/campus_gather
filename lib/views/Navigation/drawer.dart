import 'package:campus_gather/views/Event/event_home_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 157, 34, 53),
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('CatsConnect'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EventHomeScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Wildcats'),
            onTap: () {
              // Navigate to Wildcats screen
            },
          ),
        ],
      ),
    );
  }
}
