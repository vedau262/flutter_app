import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Parent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ParentState();
  }

}

class ParentState extends State<StatefulWidget>{
  String data = "no";
  String datatoParent ='Greetings from the coming father';
  void onDataChange(val) {
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("put value"),
      ),
      body: Container(
        child: Center(
          widthFactor: 10.0,
          heightFactor: 1.5,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // DemoPage(),
              ChildTwo(datatoParent: datatoParent, callback: (val) => onDataChange(val)),
              Container(
                child: Text("Text get from child: $data"),
              )
            ],
          ),
        )
      ),
    );

    /*return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const DemoPage(),
    );*/

  }

}

class ChildTwo extends StatefulWidget {
  ChildTwo({required this.datatoParent, this.callback}) : super();
  final callback;
  String datatoParent;

  @override
  _ChildTwoState createState() => _ChildTwoState();
}

class _ChildTwoState extends State<ChildTwo> {
  String data ="Greetings from the Father Component";
  void firedA() {
    print("A click was triggered in the subcomponent");
    widget.callback('$inputTxt');
  }

  late String inputTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 3),
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 3.0),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
            child:Text(widget.datatoParent),
          ),
          ElevatedButton(
            onPressed: firedA,
            child: new Text('to parent component'),
          ),
          TextField(
              decoration: const InputDecoration(
                hintText: 'Pass value to parent component',
                contentPadding: const EdgeInsets.all(10.0),
              ),
              // When the monitored value changes, monitor the input value
              onChanged: (val) {
                setState(() {
                  inputTxt = val;
                });
                print(inputTxt);
              }),
        ],
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Something>(
      create: (context) => Something(),
      child: ChildWidget(),
    );
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<Something>(context);
    final counter = Something();
    counter.addListener(() {

    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo provider"),
      ),
      body: Center(
          child: Container(
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      child: (
                          Text("minus")
                      ),
                      onPressed: (){
                        counter.decrement();
                      },
                    ),

                    Text(counter.currentCount.toString()),

                    TextButton(
                      child: (
                          Text("plus")
                      ),
                      onPressed: (){
                        counter.increment();
                      },
                    )
                  ]
              )
          )
      ),

    );
  }
}

class Something extends ChangeNotifier {
  final description = "something is better than nothing";
  int _counter = 0;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int get currentCount => _counter;
}
