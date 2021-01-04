


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStreamClass extends StatefulWidget {





  @override
  _MyStreamClassState createState() => _MyStreamClassState();
}

class _MyStreamClassState extends State<MyStreamClass> {
  final StreamController _streamController = StreamController<int>();
 static int _counter = 0;

  @override
  void dispose() {

    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return StreamBuilder<int>(
    initialData: _counter,
    stream: _streamController.stream,
    builder: (context, AsyncSnapshot<int> snapshot){
      return Scaffold(
        body: Center(child: _body(snapshot.data)),
        floatingActionButton: _footer(_streamController),
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
          'StreamBuilder Sayaç : $_counter',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}

class _footer extends StatelessWidget {
  var _streamControllar = StreamController<int>();
  _footer(this._streamControllar);

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
            _streamControllar.sink.add(++ _MyStreamClassState._counter);
          },
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
            heroTag: '2',
            child: Icon(Icons.remove),
            onPressed:(){
              _streamControllar.sink.add(-- _MyStreamClassState._counter);
            }, ),
      ],
    );
  }
}
