


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_state_kullanimi/Bloc/Sayac/sayac_event.dart';

import 'Bloc/Sayac/sayac_bloc.dart';

class BlocPattern extends StatefulWidget {





  @override
  _BlocPatternState createState() => _BlocPatternState();
}

class _BlocPatternState extends State<BlocPattern> {

final _sayacEvent = SayacEvent();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: _sayacEvent.sayac ,
      builder: (context, snapshot){
        return Scaffold(
          body: Center(child: _body(snapshot.data)),
          floatingActionButton: _footer(_sayacEvent),
        );
      },
    );


  }
}

class _body extends StatelessWidget {
  int _counter;
  _body(this._counter);

  @override
  Widget build(BuildContext context) {
    print("body çalıştı");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bloc Pattern Sayaç : $_counter',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}

class _footer extends StatelessWidget {
  var sayacEvent = SayacEvent();
  _footer(this.sayacEvent);

  @override
  Widget build(BuildContext context) {
    print("footer çalıştı");
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: '1',
          child: Icon(Icons.add),
          onPressed:(){
            sayacEvent.sayacEventFunc.add(SayacIncrease());
          },
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          heroTag: '2',
          child: Icon(Icons.remove),
          onPressed:(){
            sayacEvent.sayacEventFunc.add(SayacDecrease());
          }, ),
      ],
    );
  }
}
