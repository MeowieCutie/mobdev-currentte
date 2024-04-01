import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            SizedBox(height: 100),
            Container(
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
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    powerConsumption,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'ESTIMATED ELECTRICITY BILL:',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'P 1500.00', // Replace with actual estimated bill
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'MONTHLY DUE DATE:',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
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
                              style: TextStyle(fontSize: 25, color: Colors.grey),
                            ),
                      SizedBox(width: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}
