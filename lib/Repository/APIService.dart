import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/ForecastModel.dart';
class APIService{
Future<Map<String,dynamic>> fetchData() async{
  String  url="https://api.open-meteo.com/v1/forecast?latitude=26.7505&longitude=83.3634&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m";
  final response =await http.get(Uri.parse(url));

  if(response.statusCode==200){
    final Map<String,dynamic> jsonData=jsonDecode(response.body);
    final weatherForecastData = jsonData['current_weather'];
    final weatherforecast=CurrentWeather.fromJson(weatherForecastData);
    final temperature=weatherforecast.temperature.toString();
    final windspeed =weatherforecast.windspeed.toString();
    final time=weatherforecast.time.toString();
    final windDirection= weatherforecast.winddirection.toString();
    Map<String,dynamic> weatherData= {'temperature':temperature,'windspeed':windspeed,'time':time,'windDirection':windDirection};
    return weatherData;
  }else{
    return {'temperature':'no data','windspeed':'no data','time':'no data','windDirection':'no data'};

}
}}
