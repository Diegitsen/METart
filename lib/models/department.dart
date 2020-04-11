class DepartmentModel {
  List<Department> departments = [];

  DepartmentModel.fromJson(Map<String, dynamic> parsedJson) {
    List<Department> temp = [];
    for (int i = 0; i < parsedJson['departments'].length; i++) {
      Department department = Department(parsedJson['departments'][i]);
      temp.add(department);
    }
    departments = temp;
  }

  List<Department> get results => departments;

}



class Department {
  int _id;
  String _name;


  Department(department) {
    _id = department['departmentId'];
    _name = department['displayName'];
  }


  int get id => _id;

  String get name => _name;

}
