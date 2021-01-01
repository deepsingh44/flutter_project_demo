import 'package:expense_project_flutter/anotherblocpattern/person_bloc.dart';
import 'package:expense_project_flutter/anotherblocpattern/person_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Person API"),
        ),
        body: BlocProvider(
          create: (context) => PersonBloc(
            PersonRepo(),
          ),
          child: MyMainPage(),
        ),
      ),
    );
  }
}

class MyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final personBloc = BlocProvider.of<PersonBloc>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<PersonBloc, PersonState>(
            builder: (context, state) {
              if (state is PersonIsNotSearched) {
                return Container(
                  child: Column(
                    children: [
                      Image.asset("images/layer.jpg",width: 200,height: 200,),
                      SizedBox(height: 10,),
                      Text("Person Information",style: TextStyle(fontSize: 30),),
                      SizedBox(height: 20,),
                      Text("Bloc Pattern",style: TextStyle(fontSize: 20),),
                      SizedBox(height: 20,),
                    ],
                  ),
                );
              } else if (state is PersonIsLoading)
                return Center(child: CircularProgressIndicator());
              else if (state is PersonIsLoaded)
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.getPersons.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(state.getPersons[index].name),
                      subtitle: Text(state.getPersons[index].id.toString()),
                    );
                  },
                );
              else
                return Text(
                  "Error",
                  style: TextStyle(color: Colors.white),
                );
            },
          ),



          ElevatedButton(
            child: Text("Get All Person"),
            onPressed: () {
              personBloc.add(FetchAllPerson());
            },
          ),
        ],
      ),
    );
  }
}
