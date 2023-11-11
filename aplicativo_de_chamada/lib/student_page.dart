import 'package:aplicativo_de_chamada/classes_student_was_absent.dart';
import 'package:flutter/material.dart';
import 'disciplines_list.dart';
import 'user_information.dart';
import 'presence_for_student.dart';
import 'detailed_presence_for_student.dart';
import 'classes_student_was_in.dart';

class StudentPageStateCall extends StatefulWidget{

  final String emailUser;

  const StudentPageStateCall({super.key, required this.emailUser});

  @override
  StudentPage createState() => StudentPage();
}

class StudentPage extends State<StudentPageStateCall>{

  int _selectedIndex = 0;

  List<Widget> getWidgetOptions() {
    return [
      DisciplineListState(emailUser: widget.emailUser),
      ClassesStudentWasInListState(emailUser: widget.emailUser),
      PresenceForStudentCheckState(emailUser: widget.emailUser),
      ClassesStudentWasAbsentListState(emailUser: widget.emailUser),
      DetailedPresenceForStudentState(emailUser: widget.emailUser),
      UserInformationPageState(emailUser: widget.emailUser),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final widgetOptions = getWidgetOptions();
    String emailUser = widget.emailUser;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Bem-vindo, $emailUser'),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 162, 236, 201),
        unselectedItemColor: Colors.white,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Matérias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.addchart_rounded),
            label: 'Presente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Pegar presença',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.clear_rounded),
            label: 'Ausente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.align_horizontal_left_rounded ),
            label: 'Frequência',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Usuário',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

}