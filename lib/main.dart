import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_kullanimi/auth_service.dart';
import 'package:provider_state_kullanimi/counter.dart';
import 'BlocPattern.dart';
import 'MyProdiverClass.dart';
import 'MyStreamClass.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/':(context) =>  MyHomePage(),
        '/Provider':(context)=>
            MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => Counter(0)),
                  ChangeNotifierProvider(create: (_) => AuthService()),
                ],
                child: MyProdiverClass()),
        '/Stream':(context) => MyStreamClass(),
        '/BlocPattern':(context) => BlocPattern(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentCounter;
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    //
    return Scaffold(

      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(child: Text("Provider Class Go Current"),
            onPressed: (){
              Navigator.pushNamed(context, '/Provider');
            }),

            FlatButton(child: Text("StreamBuilder Class"),
                onPressed: (){
                  Navigator.pushNamed(context, '/Stream');
                }),

            FlatButton(child: Text("Block Pattern"),
                onPressed: (){
                  Navigator.pushNamed(context, '/BlocPattern');
                }),
          ],
        ),
      )

    );
  }
}
