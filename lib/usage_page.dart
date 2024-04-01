import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 50,
            ),
            SizedBox(height: 25), // Add some space between the image and the chart
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 129, 133, 137),
              ),
              constraints: BoxConstraints(maxWidth: 400), // Define the width of the container
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Usage: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Limit left: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Overlimit: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20), // Add space between the two columns
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '50 KWH',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '385.15 KWH',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      Text(
                        '0 KWH',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 11), // Add space between the chart and other widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Set border radius
                      child: Container(
                        width: 170,
                        height: 200,
                        color: Color.fromARGB(255, 178, 190, 181),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Current usage',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5), // Add space between the text and icon
                            Icon(Icons.data_usage, size: 75), // Set icon size
                            SizedBox(height: 8),
                            Text(
                              'Average Daily',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ), // Add space between the icon and text
                            SizedBox(height: 5), // Add space between the text and icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start, // Align text to the left
                              children: [
                                Text(
                                  "    Spend: ",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5), // Add space between the text 3 and text 4
                                Text("P 272.60", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start, // Align text to the left
                              children: [
                                Text(
                                  "    KWH:   ",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5), // Add space between the text 5 and text 6
                                Text("50", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Set border radius
                      child: Container(
                        width: 170,
                        height: 200,
                        color: Color.fromARGB(255, 178, 190, 181),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Monthly Usage',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 3), // Add space between the text and icon
                            Icon(Icons.calendar_month, size: 75), // Set icon size
                            SizedBox(height: 8), // Add space between the icon and text
                            Text(
                              'Average Monthly',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5), // Add space between the text and icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start, // Align text to the left
                              children: [
                                Text(
                                  "    Spend: ",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5), // Add space between the text 3 and text 4
                                Text("P 5000.00", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start, // Align text to the left
                              children: [
                                Text(
                                  "    KWH:   ",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5), // Add space between the text 5 and text 6
                                Text("435.16", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16), // Add space between the chart and other widgets
            // Inserting the content of BillsPage below this row
            BillsPage(),
          ],
        ),
      ),
    );
  }
}

class BillsPage extends StatefulWidget {
  const BillsPage({Key? key}) : super(key: key);

  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  DateTime? selectedDate;
  late Timer _timer;
  late String powerConsumption;

  @override
  void initState() {
    super.initState();
    powerConsumption = generateRandomPowerConsumption();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        powerConsumption = generateRandomPowerConsumption();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String generateRandomPowerConsumption() {
    final random = Random();
    final power = (random.nextDouble() * (999.9 - 200.0)) + 200.0;
    return '${power.toStringAsFixed(1)} W';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 194, 193, 193), // Grey box background color
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CURRENT POWER CONSUMPTION:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            powerConsumption,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            'ESTIMATED ELECTRICITY BILL:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'P 1500.00', // Replace with actual estimated bill
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            'MONTHLY DUE DATE:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectedDate != null
                  ? Text(
                      DateFormat.yMMMMd().format(selectedDate!),
                      style: TextStyle(fontSize: 25),
                    )
                  : Text(
                      'Select your due date',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
              SizedBox(width: 5),
              IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 1),
                  );

                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}