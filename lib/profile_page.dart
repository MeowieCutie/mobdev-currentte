import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulated current email and phone number
    String currentEmail = 'john.doe@example.com';
    String currentPhoneNumber = '123-456-7890';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Image.asset(
              'assets/images/logo.png',
              height: 50,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'CURRENT - TE', // Heading
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Take control of your power! This app empowers you to see and understand your electricity usage in real-time, saving you money and energy.',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 194, 193, 193), // Grey box background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Name: ',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'John Doe',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Username: ',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'johndoe123',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Email: ',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '$currentEmail',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Phone Number: ',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '$currentPhoneNumber',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.0),
                  ElevatedButton(
                    onPressed: () {
                      // Show alert box to change phone number
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Change Phone Number"),
                            content: TextField(
                              // Add logic to capture new phone number
                              decoration: InputDecoration(
                                hintText: 'Enter new phone number',
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic to update phone number
                                  Navigator.of(context).pop();
                                },
                                child: Text('Save', style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Change Phone Number', style: TextStyle(color: Colors.blueAccent)),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Show alert box to change email address
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Change Email Address"),
                            content: TextField(
                              // Add logic to capture new email address
                              decoration: InputDecoration(
                                hintText: 'Enter new email address',
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic to update email address
                                  Navigator.of(context).pop();
                                },
                                child: Text('Save', style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Change Email Address', style: TextStyle(color: Colors.blueAccent)),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Show alert box to change password
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Change Password"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  // Add logic to capture current password
                                  decoration: InputDecoration(
                                    hintText: 'Enter current password',
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                TextField(
                                  // Add logic to capture new password
                                  decoration: InputDecoration(
                                    hintText: 'Enter new password',
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic to update password
                                  Navigator.of(context).pop();
                                },
                                child: Text('Save', style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Change Password', style: TextStyle(color: Colors.blueAccent)),
                  ),
                ],
              ),
            ),
            Spacer(), // Expandable space to push content to the top
          ],
        ),
      ),
    );
  }
}