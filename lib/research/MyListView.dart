import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('ListViews')),
       body: _myListView(context),
     );
  }

  // replace this function with the code in the examples
  Widget _myListView(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            title: Text('Dog'),
          ),
          ListTile(
            title: Text('Cat'),
          ),
          ListTile(
            title: Text('Rabbit'),
          ),
        ],
      ).toList()
    );
  }
  
}

class MyListView2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyListView2State();
  }
}

class MyListView2State extends State<MyListView2> {
  bool _loading = false;
  late ScrollController controller;
  List<String> items = List<String>.generate(europeanCountries.length, (index) => europeanCountries[index]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListViews')),
      body: Stack(
        children: [
          _myListView(context),
          _loading ? Center(child: CircularProgressIndicator()) : SizedBox(width: 0, height: 0,)
        ],
      )


    );
  }

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    print("_scrollListener: ${controller.position.extentAfter}" );
   /* if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(europeanCountries);
      });
    }*/

    if (controller.position.pixels ==
        controller.position.maxScrollExtent) {
      print('Page reached end of page');
      setState(() {
        runLoading();
        items.addAll(new List.generate(42, (index) => 'Inserted $index'));
      });

    }
  }

  void runLoading(){
    setState(() {
      _loading = true;
    });
    Timer(Duration(milliseconds: 1500), (){
      setState(() {
        _loading = false;
      });
    });
  }

  /*Future<String> fetchPost(gcm) async {
    setState(() {
      _loading = true;
    });
    String url =
        'https://eample.org/api.php?action=query&gcmtitle=Category:$cname&pilimit=max&prop=pageimages&pithumbsize=200&generator=categorymembers&format=json&gcmcontinue=$gcm';
    final response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      data = Herbslist.fromJson(json.decode(response.body));
      pages.addAll(data.query.pages.values);
      setState(() {
        _loading = false;
      });
      return data;
    } else {
      setState(() {
        _loading = false;
      });
      throw (e) {
        print("Exception thrown: $e");
        Exception(e);
      };
    }
  }*/


  // replace this function with the code in the examples
  Widget _myListView(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: items.length,
      itemBuilder: (context, index){
        return Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              side:  BorderSide(color: Colors.green,width: 3),
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: InkWell(
            onTap:() {
              print("on tap item: $index");
            },
            child: ListTile(
              onTap: (){
                print("on tap ListTile: $index");
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/sun.jpeg'),
              ),
              title: Text(items[index]),
              subtitle: Text("$index"),
              trailing: Icon(Icons.keyboard_arrow_right),

            ),
          ),
        );
      },

      /*separatorBuilder: (context, index) {
        return Divider();
      },*/
      // scrollDirection: Axis.horizontal,
    );
  }


}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late ScrollController controller;
  List<String> items = new List.generate(100, (index) => 'Hello $index');

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scrollbar(
        child: new ListView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return new Text(items[index]);
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(new List.generate(42, (index) => 'Inserted $index'));
      });
    }


  }
}


// backing data
final List<String> europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
  'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
  'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
  'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
  'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
  'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
  'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
  'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
  'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

