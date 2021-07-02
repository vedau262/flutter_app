import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage>{
  int selectIndex =0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        title: Text("Title of Details Page"),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  boxShadow: [

                    BoxShadow(
                        offset: Offset.zero,
                        color: Colors.blue,
                        blurRadius: 1,
                        spreadRadius: 8
                    ),
                    BoxShadow(
                        offset: Offset.zero,
                        color: Colors.red,
                        blurRadius: 1,
                        spreadRadius: 8
                    )


                  ]
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.brown,
              child: SizedBox(
                width: 500,
                height: 500,
                child: IndexedStack(
                  sizing: StackFit.passthrough,
                  alignment: Alignment.center,
                  index: this.selectIndex,
                  children: [
                    ElevatedButton(
                      child: Text('Close'),
                      onPressed: () {
                        // Close page and pass a value back to previous page
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        "index stack $selectIndex",
                        style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                      onPressed: (){},
                    ),
                    Container(
                      width: 500,
                      height: 500,
                      color: Colors.red,
                      child: Text("index stack $selectIndex",)
                    )
                  ],
                ),
              ),
            ),
          ),
          Transform(
            alignment: FractionalOffset.topLeft,
            transform: Matrix4.skewY(0.4), // skew will not go out of y bounds
            child: Container(
              height: 100,
              width: 200,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("Next"),
          onPressed: ()  {
            setState(() => setIndexStack());
          }
      ),
    );
  }

  void setIndexStack(){
    if(this.selectIndex<2){
      this.selectIndex ++;
    } else {
      this.selectIndex= 0;
    }
    print("setIndexStack: $selectIndex");
  }
}

