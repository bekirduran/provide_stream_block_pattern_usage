import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_kullanimi/auth_service.dart';
import 'package:provider_state_kullanimi/counter.dart';

class MyProdiverClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);

    switch (myAuth.state) {
      case userState.notLogin:
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lütfen Oturum Açınız",
                  style: TextStyle(fontSize: 30),
                ),
                FlatButton(onPressed: ()async{
                await myAuth.singIngUserWithEmailAndPassword("bekir@gmail.com", "password");
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Log In"),
                    Icon(Icons.login),
                  ],
                )),
                FlatButton(onPressed: ()async{
                  await myAuth.createUserWithEmailAndPassword("bekir2@gmail.com", "password");
                }, child: Text("Sign In")),
              ],
            ),
          ),
        );
      case userState.logging:
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case userState.logined:
        return Scaffold(
          body: Center(child: _body()),
          floatingActionButton: _footer(),
        );
    }
  }
}

class _body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("body çalıştı");
    final myAuth = Provider.of<AuthService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sayaç : ${context.watch<Counter>().counterNum}',
          style: TextStyle(fontSize: 30),
        ),
        FlatButton(onPressed: ()async{
          await myAuth.signOut();
        }, child: Text("Log Out -> ${myAuth.user.email}"))
      ],
    );
  }
}

class _footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("footer çalıştı");
    var myCounter = Provider.of<Counter>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: '1',
          child: Icon(Icons.add),
          onPressed: myCounter.increase,
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            heroTag: '2',
            child: Icon(Icons.remove),
            onPressed: myCounter.decrease),
      ],
    );
  }
}
