
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
  String imageUrl = "https://s3.o7planning.com/images/boy-128.png";
  // String imageUrl = "https://file-not-found";
  bool _loadImageError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("CardDemo"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child:
          Column(
            children: [
            Card(
              child: Column(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.place),
                    title: Text('Ha Long Bay'),
                    subtitle: Text('Halong Bay is a UNESCO World Heritage Site and a popular tourist destination'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: FutureBuilder<Widget>(
                      future: getImage(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData!=null) {
                          return (snapshot.data!!);
                        } else {
                          return Text('LOADING...');
                        }
                      },
                    ),
                  ) ,
                  ButtonBarTheme ( // make buttons use the appropriate styles for cards
                    data: ButtonBarThemeData(),
                    child: ButtonBar(
                      children: <Widget>[
                        TextButton(
                          child: const Text('Add to Bookmark'),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('Show More'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

              Card (
                margin: EdgeInsets.all(10),
                color: Colors.green[100],
                shadowColor: Colors.blueGrey,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon (
                          Icons.album,
                          color: Colors.cyan,
                          size: 45
                      ),
                      title: Text(
                        "Let's Talk About Love",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('Modern Talking Album'),
                    ),
                  ],
                ),
              ),

              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.cyan,
                backgroundImage: this._loadImageError? null : NetworkImage(this.imageUrl),
                onBackgroundImageError: (_ , __){
                  // print("Error loading image! " + exception.toString());

                  setError() {
                    this._loadImageError = true;
                  };
                },
                child: this._loadImageError? Text("Error loading image!") : Image.network('https://www.woolha.com/media/2020/03/flutter-using-circleavatar-examples-1200x627.jpg')
              )
          ],
        ),
       ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          this.showSnackBarMessage(context);
        },
      ),
    );
  }

  Future<Widget> getImage() async {
    final Completer<Widget> completer = Completer();
    final url = 'https://s3.o7planning.com/images/ha-long-bay.png';
    final image = NetworkImage(url);
    //
    final load = image.resolve(const ImageConfiguration());

    // Delay 1 second.
    await Future.delayed(Duration(seconds: 1));

    final listener = new ImageStreamListener((ImageInfo info, isSync) async {
      print(info.image.width);
      print(info.image.height);
      completer.complete(Container(child: Image(image: image)));
    });

    load.addListener(listener);
    return completer.future;
  }

  void showSnackBarMessage(BuildContext context) {
    final snack = SnackBar(
      content: Text("Message is deleted!"),
      backgroundColor: Colors.blue,
      action: SnackBarAction(
        label: "UNDO",
        textColor: Colors.white,
        onPressed: () {
          this._showSnackBarMessageRestore(context);
        },
      ),
    );
    print("showSnackBarMessage");
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void _showSnackBarMessageRestore(BuildContext context) {
    final snack = SnackBar(
      content: Text("Message is restored!"),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

}