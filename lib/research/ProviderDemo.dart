import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel with ChangeNotifier {
  String user = "init user";

  void loginSuccess(String value) {
    user = value;
    notifyListeners();
  }

  void updateUser(String value){
    user = value;
    notifyListeners();
  }
}

class ProviderDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (_) => UserModel(),
          child: ProfilePage()
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context, listen: false);
    return new Scaffold(
      appBar: AppBar(
        title: Text('Profile page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Selector<UserModel, String>(
              selector: (buildContext, userProvider) => userProvider.user,
              builder: (context, data, child) {
                // return Text('current user is ${user.user}');
                return Text('selector - current user is ${data}');
              },
            ),

            Consumer<UserModel>(
                builder: (_, data, __) => Text('Consumer - current user is ${data.user}')
            ),

            ElevatedButton(
              onPressed: () {user.updateUser("test4");},
              child: Text("update name to: " + "test4"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider.value(
                          value: Provider.of<UserModel>(context, listen: false),
                          child: LoginPage())));
                },
                child: Text('login')),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login page'),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Provider.of<UserModel>(context, listen: false)
                    .loginSuccess('TBM99');
              },
              child: Selector<UserModel, String>(
                selector: (_, m) => m.user,
                builder: (_, data, __) {
                  return Text('current user is $data, login demo');
                },
              ),
            ),
          ),
        ));
  }
}