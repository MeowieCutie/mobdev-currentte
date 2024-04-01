import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter

import 'simple_time_series_chart.dart';
import 'usage_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
        SizedBox(height: 10), // Add some space between the image and the chart
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 194, 193, 193), // Set the background color to grey
            ),
            child: Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Monthly Chart",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SimpleTimeSeriesChart.withSampleData(),
              ],
            ),
          ),
        ),
        SizedBox(height: 16), // Add space between the chart and other widgets
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Set border radius
                  child: Container(
                    width: 170,
                    height: 250,
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
                        SizedBox(height: 15,),
                  ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UsagePage()),
    );
  },
  child: Text('More Details', style: TextStyle(color: Colors.blueAccent)),
),
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
                    height: 250,
                    color: Color.fromARGB(255, 178, 190, 181),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Set Limit',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 3), // Add space between the text and icon
                        Icon(Icons.lock_clock_outlined, size: 75), // Set icon size
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
                        SizedBox(height: 15,),
                        ElevatedButton(
                          onPressed: () {
                            // Add onPressed functionality
                            _showSetLimitDialog(context);
                          },
                          child: Text('More Details', style: TextStyle(color: Colors.blueAccent)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Function to show the set limit dialog
  void _showSetLimitDialog(BuildContext context) {
    TextEditingController kwhController = TextEditingController();
    TextEditingController estimatedBillController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("SET YOUR MONTHLY LIMIT"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: kwhController,
                decoration: InputDecoration(labelText: "Monthly KwH: (maximum)"),
                keyboardType: TextInputType.number, // Set keyboard type to numeric
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
              ),
              TextFormField(
                controller: estimatedBillController,
                decoration: InputDecoration(labelText: "Estimated Payment: (estimated bill)"),
                keyboardType: TextInputType.number, // Set keyboard type to numeric
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
              ),
             
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Add onPressed functionality for Set Limit button
                Navigator.of(context).pop();
              },
              child: Text("Set Limit"),
            ),
          ],
        );
      },
    );
  }
}
