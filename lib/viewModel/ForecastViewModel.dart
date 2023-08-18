
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forecast/Repository/APIService.dart';
import 'package:provider/provider.dart';
class ForecastViewModel extends ChangeNotifier{
  String temperature="fetching";
  String windspeed="fetching";
  String time="fetching";
  String windDirection="fetching";
  late Timer _timer;
  ForecastViewModel(){
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      getData();
    });
  }

  Future<void> getData() async{
Map<String,dynamic> weatherData=await APIService().fetchData();
temperature =weatherData['temperature'];
windspeed=weatherData['windspeed'];
time=weatherData['time'];
windDirection=weatherData['windDirection'];
notifyListeners();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

}
