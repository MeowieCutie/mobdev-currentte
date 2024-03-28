import 'package:flutter/material.dart';



class UsagePage extends StatelessWidget {
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
                    height: 200,
                    color: const Color.fromARGB(255, 194, 193, 193),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ SizedBox(height: 10 ), 
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
                         Text('Average Daily', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),// Add space between the icon and text
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
                    color: const Color.fromARGB(255, 194, 193, 193),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        SizedBox(height: 10 ), 
                        Text(
                          'Monthly Usage',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 3 ), // Add space between the text and icon
                        Icon(Icons.calendar_month, size: 75), // Set icon size
                        SizedBox(height: 8), // Add space between the icon and text
                        Text('Average Monthly', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
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
      
      ],
    );
  }
}
