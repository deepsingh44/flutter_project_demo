import 'package:expense_project_flutter/myblocpattern/bloc.dart';
import 'package:expense_project_flutter/myblocpattern/repo.dart';
import 'package:expense_project_flutter/myblocpattern/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyDemo());
}

class MyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Pattern"),
        ),
        body: BlocProvider(
          create: (context) => StudentBloc(Repo()),
          child: MyUi(),
        ),
      ),
    );
  }
}

class MyUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentBloc = BlocProvider.of<StudentBloc>(context);
    return Column(
      children: [
        Container(
          child: BlocBuilder<StudentBloc, StudentState>(
            builder: (context, state) {
              if (state is StudentIsNotSearched) {
                return Text("Not Search");
              } else if (state is StudentIsLoaded) {
                return MyListData(state.getStudents);
              } else if (state is StudentIsLoading) {
                return Center(child: CircularProgressIndicator(),);
              } else {
                return Text("Error page");
              }
            },
          ),
        ),
        ElevatedButton(
          child: Text("Fetch All Student"),
          onPressed: () {
            studentBloc.add(FetchAllStudent());
          },
        ),
      ],
    );
  }
}

class MyListData extends StatelessWidget {
  List<Student> students = [];

  MyListData(this.students);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: students.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(students[index].name),
        subtitle: Text(students[index].roll),
        leading: Icon(Icons.edit),
      ),
    );
  }
}
