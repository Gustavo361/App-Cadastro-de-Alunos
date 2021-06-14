import 'package:flutter/material.dart';
import 'package:projeto_cadastro_de_alunos/models/student.dart';
import 'package:projeto_cadastro_de_alunos/shared/menu.dart';

class MainScreen extends StatelessWidget {
  final dynamic _data;
  late List<Student> _students;

  MainScreen(this._data);

  @override
  Widget build(BuildContext context) {
    _students = prepareStudents(_data);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meus Alunos",
        ),
      ),
      drawer: Menu(),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: _students.length,
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(
        Icons.account_box,
      ),
      title: Text(
        _students.elementAt(index).name!,
      ),
      subtitle: Text(
        _students.elementAt(index).email!,
      ),
    );
  }

  List<Student> prepareStudents(dynamic data) {
    List<Student> students = [];
    for (int index = 0; index < data.lenght; index++) {
      students.add(Student.toObjetic(data[index]));
    }
    return students;
  }
}
