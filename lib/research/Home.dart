import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/research/MyListView.dart';
import 'package:provider/provider.dart';

import 'PutValue.dart';
import 'Router.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('MyHomePage'),
          /*leading: IconButton(
          icon: Icon(Icons.notifications_active),
          onPressed:() {
            showAlert(context);
          }
        ),*/
          leading: MyVolumeButton(),

          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: () => {
                print("Click on upload button")
              },
            ),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => {
                  print("Click on settings button")
                }
            ),
            PopupMenuButton(
              icon: Icon(Icons.share),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Facebook"),

                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Instagram"),
                ),
              ],
            )
          ],

      ),

      backgroundColor: Colors.greenAccent,

      body: Align(
        alignment: Alignment.centerRight,
        widthFactor: 10.0,
        heightFactor: 1.5,
        child: Container(
          color: Colors.greenAccent[99],
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage("https://s3.o7planning.com/images/tom-and-jerry.png"),
              fit: BoxFit.fill
            ),
            border:Border.all(color: Colors.black, width: 8),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),

              Text(
                'Click the floating action button to show bottom sheet.',
              ),
              ElevatedButton(
                  onPressed:() {
                    // Navigator.pushNamed(context, examplePage);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider.value(
                            value: Provider.of<Something>(context, listen: false),
                            child: ExamplePage()
                        )
                    )
                    );
                  },
                  child: Text("Go to provider")
              ),
              ElevatedButton(
                  onPressed:() {
                    Navigator.pushNamed(context, myListView2);
                  },
                  child: Text("myListView2")
              ),
              ElevatedButton(
                  onPressed:() {
                    Navigator.pushNamed(context, about);
                  },
                  child: Text("Go to About Page")
              ),
              ElevatedButton (
                  child: Text("Go to Details Page"),
                  onPressed: () {
                    Navigator.pushNamed(context, details);
                  },

                  style: ButtonStyle (
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blue;
                            }
                            return Colors.blueAccent; // Use the component's default.
                          }
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)
                              ||  states.contains(MaterialState.disabled)) {
                            return 0;
                          }
                          return 10; // Use the component's default.
                        },
                      )

                  )
              ),

              Banner(
                message: "Offer 20 off",
                location: BannerLocation.topEnd,
                color: Colors.yellow,
                child: Container(
                  width: 200,
                  height: 150,
                  child:Image.network("https://autopro8.mediacdn.vn/2018/6/22/2018-toyota-century-1-15296781503521584399465.jpg"),
                ),
              )

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMyBottomSheet(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      drawer: Drawer(
        child: ListView(
          children: const<Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Hello world',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Gallery'),
            ),
            ListTile(
              title: Text('Slideshow'),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon  : Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon  : Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon  : Icon(Icons.account_circle),
          ),
        ],
        onTap: (int indexOfItem){
          print("click on $indexOfItem");
        },
      ),

      bottomSheet: Container(
          height: 55,
          color: Colors.cyan[50],
          child:Column    (
            children: [
              Row (
                children: [
                  Icon(Icons.place),
                  SizedBox(width:5, height:5),
                  Text("199 Valencia St, San Francisco, CA")
                ],
              ),
              Row (
                children: [
                  Icon(Icons.phone),
                  SizedBox(width:5, height:5),
                  Text("(415) 339-0942)")
                ],
              )
            ],
          )
      ),

      persistentFooterButtons :  [
        TextButton.icon(icon: Icon(Icons.map), label: Text(""), onPressed: () {}),
        TextButton.icon(icon: Icon(Icons.view_week), label: Text(""), onPressed: () {}),
      ],

    );
  }

  void _showMyBottomSheet(BuildContext context) {
    _incrementCounter();

    // Call showModalBottomSheet(), this function open a Dialog
    // and return Future object.
    showModalBottomSheet (
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.4,
            child: Center(
              child: Text("Welcome to o7planning.org!"),
            ),
          );
        }
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Hi"),
        ));
  }

}

class MyVolumeButton extends StatefulWidget {
  MyVolumeButton() : super();

  @override
  State<StatefulWidget> createState() {
    return MyVolumeButtonState();
  }
}

class MyVolumeButtonState extends State<MyVolumeButton> {
  bool volumeOn = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: this.volumeOn? Icon(Icons.volume_up):Icon(Icons.volume_mute),
        onPressed: () {
          // Set new State
          setState(() => this.volumeOn = !this.volumeOn);
        }
    );
  }
}