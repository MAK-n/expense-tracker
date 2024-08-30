import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  //final VoidCallback onThemeChanged;

  //SettingsScreen({required this.onThemeChanged});
  const SettingsScreen({super.key});

  void deleteAccount(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Account'),
            content: Text('Are you sure you want to delete your account?'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Delete'),
                onPressed: () {
                  // Handle delete account logic
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void reportBug(BuildContext context) {
    // Handle report bug logic
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Report a Bug'),
            content: Text('Please provide a description of the bug.'),
            actions: <Widget>[
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: Text('Save'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  void submitFeedback(BuildContext context) {
    // Handle report bug logic
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Feedback'),
            content: Text('Your opinion is highly valued.'),
            actions: <Widget>[
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: Text('Save'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          // Account Settings Section
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.account_circle,
                  color: Theme.of(context).primaryColor),
              title: Text('Account Settings'),
              onTap: () {
                // Handle Account Settings
              },
            ),
          ),
          // Notifications Section
          // Delete Account Section
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.delete_forever, color: Colors.red),
              title:
                  Text('Delete Account', style: TextStyle(color: Colors.red)),
              onTap: () {
                deleteAccount(context);
                // Handle Delete Account
              },
            ),
          ),
          // Report a Bug Section
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.bug_report, color: Colors.orange),
              title:
                  Text('Report a Bug', style: TextStyle(color: Colors.orange)),
              onTap: () {
                // Handle Report a Bug
                reportBug(context);
              },
            ),
          ),
          // Send Feedback Section
          Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.feedback, color: Colors.green),
              title:
                  Text('Send Feedback', style: TextStyle(color: Colors.green)),
              onTap: () {
                submitFeedback(context);
                // Handle Send Feedback
              },
            ),
          ),
        ],
      ),
    );
  }
}
