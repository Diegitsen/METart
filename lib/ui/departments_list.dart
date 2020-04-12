import 'package:flutter/material.dart';
import 'package:met_art/models/department.dart';
import 'package:met_art/models/object_list.dart';
import 'package:met_art/blocs/pieces_bloc_provider.dart';
import 'package:met_art/ui/pieces_list.dart';
import '../blocs/departments_bloc.dart';
import 'package:met_art/ui/department/widgets/department_card.dart';

class DepartmentsList extends StatefulWidget {
  @override
  DepartmentsListState createState() {
    return new DepartmentsListState();
  }
}

class DepartmentsListState extends State<DepartmentsList> {
  @override
  void initState() {
    super.initState();
    //bloc.fetchAllPieces();
    bloc.fetchAllDepartments();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pieces of Art'),
      ),
      body: StreamBuilder(
        stream: bloc.allDepartments,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot); //buildList(snapshot);
          } else if (snapshot.hasError) {
            print("Inside hasError");
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<DepartmentModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      /*itemBuilder: (context, index) => DepartmentCard(
        snapshot.data.departments[index],
        onPress: () => Navigator.of(context).pushNamed("/pokedex"),
      ),*/
      itemBuilder: (context, index) {
        return DepartmentCard(
          snapshot.data.departments[index],
          onPress: () => goToPiecesListPage(snapshot.data, index),
        );
      },
    );
  }

  goToPiecesListPage(DepartmentModel data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PiecesListBlocProvider(
        child: PiecesListScreen(
          departmentId: data.departments[index].id,
          total: data.departments.length,
        ),
      );
    }));
  }
}
