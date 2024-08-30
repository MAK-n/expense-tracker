
import 'package:expense_tracker/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDrawer extends StatelessWidget {
  // final VoidCallback onThemeChanged;

  // CustomDrawer({required this.onThemeChanged});
  
  CustomDrawer();

  @override
  Widget build(BuildContext context) {
    return   
    Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('FULL NAME'),
            accountEmail: Text('No.- XXXXXXXXXX'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.webp'), // Ensure you have this asset
            ),
            decoration: BoxDecoration(
              color: Colors.grey[800],
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Exit'),
            onTap: () {
              Navigator.pop(context);
              SystemNavigator.pop(); // Close the drawer
              // Add Exit functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (bool value) {
                // Toggle theme mode
                
              },
            ),
            onTap: () {
              // Trigger theme change
            },
          ),
        ],
      ),
    );
  }
}