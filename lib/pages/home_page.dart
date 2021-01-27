import 'package:api_training/model/post_model.dart';
import 'package:api_training/services/service_for_http.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String info;

  void _apiPostEmployees(){
    Baza.GET(Baza.API_ALL_EMP, Baza.emptyParam()).then((response) => {
      _showResult(response),
    });
  }
  void _apiPostEmployee(){
    Baza.GET(Baza.API_AN_EMP+"1", Baza.emptyParam()).then((response) => {
      _showResult(response),
    });
  }

  void _apiCreateEmployee(Posts posts){
    Baza.POST(Baza.API_Create, Baza.createParam(posts)).then((response) => {
      _showResult(response),
    });
  }

  void _apiUpdateEmployee(Posts posts){
    Baza.PUT(Baza.API_Update+posts.id.toString(), Baza.updateParam(posts)).then((response) => {
      _showResult(response),
    });
  }

  void _apiDeleteEmployee(Posts posts){
    Baza.DEL(Baza.API_Delete+posts.id.toString(), Baza.emptyParam()).then((response) => {
      _showResult(response),
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Posts(id: 1, employee_name: "Ishchi", employee_age: 22, employee_salary: "22000\$", profile_image: " " );
    // _apiPostEmployees();
    // _apiPostEmployee();
    // _apiCreateEmployee(post);
    // _apiUpdateEmployee(post);
    _apiDeleteEmployee(post);
  }

  _showResult(String response){
    setState(() {
      info = response;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(info != null ? info: "Ma'lumot yo'q", style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
