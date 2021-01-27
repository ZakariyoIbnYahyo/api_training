import 'dart:convert';

import 'package:api_training/model/post_model.dart';
import 'package:http/http.dart';

class Baza{

  static String BASE ="dummy.restapiexample.com";

  static Map<String, String> headers = {'Content-type': 'application/json; charset=UTF-8'};

  static String API_ALL_EMP = "/api/v1/employees";
  static String API_AN_EMP = "/api/v1/employee/";//{id}
  static String API_Create = "/api/v1/create";
  static String API_Update = "/api/v1/update/"; // {id}
  static String API_Delete = "/api/v1/delete/"; //{id}


    /*HTTP Request*/
  //GET
  static Future<String> GET(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);

    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  //POST
  static Future<String> POST(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api, params);
    var response = await post(uri, headers: headers, body: jsonEncode(params));

    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }

  //Update
  static Future<String> PUT(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));

    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }
  
  //Delete
  static Future<String> DEL(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri,headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }



  //Http Params
  static Map<String, String> emptyParam(){
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> createParam(Posts posts){
    Map<String, String> params = new Map();
    params.addAll({
      "employee_name" : posts.employee_name,
      "employee_salary" : posts.employee_salary,
      "employee_age" : posts.employee_age.toString(),
      "profile_image" : posts.profile_image
    });
    return params;
  }

  static Map<String, String> updateParam(Posts posts){
    Map<String, String> params = new Map();
    params.addAll({
      "id" : posts.id.toString(),
      "employee_name" : posts.employee_name,
      "employee_salary" : posts.employee_salary,
      "employee_age" : posts.employee_age.toString(),
      "profile_image" : posts.profile_image
    });
    return params;
  }



}