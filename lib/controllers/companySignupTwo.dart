import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class companyAuth2 with ChangeNotifier {
  Future<void> companySignup2(String email,String fname, String lname ,String title , String mobNumm ,String compName) async {
    final url = 'https://workinn.herokuapp.com/api/company/register/2';
    try {
      final res = await(http.post(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: json.encode({
        'email':email,
        'firstname': fname,
        'lastname':lname,
        'job_title':title,
        'mobile_number':mobNumm,
        'company_name':compName,
      })));
      final prefs=await SharedPreferences.getInstance();
      final responsedata = json.decode(res.body);
      prefs.setString('rescompdata', responsedata['response']);
      print(responsedata);
      if(responsedata['response']!='Success') {
        prefs.setString('companyerror', responsedata['error_message']);
      }


    } catch (e) {
      print(e);
    }
  }
}