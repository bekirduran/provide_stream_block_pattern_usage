import 'dart:async';

import 'package:provider_state_kullanimi/Bloc/Sayac/sayac_bloc.dart';

class SayacEvent {
  int _counter = 0;


//StateStreamController Area (ÇIKTI)
  final _counterStateStreamController = StreamController<int>();
  Stream<int> get sayac => _counterStateStreamController.stream;
  StreamSink<int> get _counterStateSink => _counterStateStreamController.sink;



  //EventStreamController Area (GİRDİ)
final _counterEventStreamController = StreamController<SayacBloc>();
StreamSink<SayacBloc>  get sayacEventFunc => _counterEventStreamController.sink;
Stream<SayacBloc> get _counterEventStream => _counterEventStreamController.stream;


// EVENT ile STATE 'in bağlantısı
SayacEvent(){
  _counterEventStream.listen(_mapEventToSate);
}


  void _mapEventToSate(SayacBloc event) {
  if(event is SayacIncrease){
    _counter++;
  }else {
    _counter--;
  }
  _counterStateSink.add(_counter);
  }
}