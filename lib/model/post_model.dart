class Posts {
  int id;
  String employee_name;
  String employee_salary;
  int employee_age;
  String profile_image;

  Posts({this.id, this.employee_name, this.employee_salary, this.employee_age,this.profile_image});

  Posts.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      employee_name = json['employee_name'],
      employee_salary = json['employee_salary'],
      employee_age = json['employee_age'],
      profile_image = json['profile_image'];

  Map<String, dynamic> toJSon() => {
    'id' : id,
    'employee_name' : employee_name,
    'employee_salary' : employee_salary,
    'employee_age' : employee_age,
    'profile_image' : profile_image
  };
}