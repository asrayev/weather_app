import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/data/models/main/weather_model.dart';
import '../weather_model.dart';
class AppRepository{

  static Future<WeatherMainModel> getWeatherMainData(String query) async {

    String url = "https://api.openweathermap.org/data/2.5/weather?q=${query}&appid=875b3422866317c394cfc64cc888eecb&units=metric";
    try{
      Response response = await http.get(Uri.parse(url));
      if (200<=response.statusCode && response.statusCode <=300){
        return WeatherMainModel.fromJson(jsonDecode(response.body));
      }
      throw Exception();
    }catch(e){
      throw Exception();
    }

  }


}