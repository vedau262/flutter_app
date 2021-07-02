import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child:
         Scaffold(
          appBar: AppBar(
            title: Text("Title of About Page"),
            bottom: createTabBar()
          ),

          body: Center(
            child: ElevatedButton(
              child: Text('Close'),
              onPressed: () {
                // Close page
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Colors.cyan[100],
        )
    );
  }

  TabBar createTabBar()  {
    return TabBar(
      tabs: [
        Row (children: [Icon(Icons.directions_car), SizedBox(width:5), Text("Car")]),
        Row (children: [Icon(Icons.directions_transit), SizedBox(width:5), Text("Transit")]),
        Row (children: [Icon(Icons.directions_bike), SizedBox(width:5), Text("Bike")]),
        Row (children: [Icon(Icons.directions_boat), SizedBox(width:5), Text("Boat")]),
        Row (children: [Icon(Icons.directions_railway), SizedBox(width:5), Text("Railway")]),
        Row (children: [Icon(Icons.directions_bus), SizedBox(width:5), Text("Bus")]),
      ],
      isScrollable: true,
      unselectedLabelColor: Colors.white,
      labelColor: Colors.red,
      indicatorWeight: 3,
      indicatorColor: Colors.red,
    );
  }
}