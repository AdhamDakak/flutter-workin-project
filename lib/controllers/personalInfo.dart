import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class personalInfoAuth with ChangeNotifier {
  String response='';
  String error='';
  // String _nationality='';
  // String _num='';
  // String _date='';
  // String _country='';
  // String _city='';
  // String _area='';
  // String get num{
  //   return _num;
  // }
  // String get nationality{
  //   return _nationality;
  // }
  // String get date{
  //   return _date;
  // }
  // String get country{
  //   return _country;
  // }
  // String get city{
  //   return _city;
  // }
  // String get area{
  //   return _area;
  // }
  String get theresponse{
    return response;
  }
  String get theError{
    return error;
  }
  Future<void> personalInfo(String email,String birthdate,String mobNumm,String gender, String nationality ,String country  ,String city,String area,) async {
    final url = 'https://workinn.herokuapp.com/api/account/user_profile/';
    try {
      final res = await(http.post(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: json.encode({
        'email':email,
        'birthdate':birthdate,
        'phone_number':mobNumm,
        'gender':gender,
        'nationality':nationality,
        'country':country,
        'city':city,
        'area':area,


      })));
      final responsedata = json.decode(res.body);
      print(responsedata);
      response=responsedata['response'];
      error=responsedata['error_message'];
      // _num=responsedata['phone_number'];
      // _date=responsedata['birthdate'];
      // _nationality=responsedata['nationality'];
      // _country=responsedata['country'];
      // _city=responsedata['city'];
      // _area=responsedata['area'];



    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}