import 'package:flutter/material.dart';
import 'package:met_art/models/department.dart';
//import 'package:met_art/blocs/movie_detail_bloc_provider.dart';
//import 'package:met_art/ui/movie_detail.dart';
import '../blocs/pieces_bloc.dart';
import 'package:met_art/models/item_model.dart';
import 'package:met_art/ui/department/widgets/department_card.dart';

class PiecesList extends StatefulWidget {
  @override
  PiecesListState createState() {
    return new PiecesListState();
  }
}

class PiecesListState extends State<PiecesList> {
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
            return buildList(snapshot);//buildList(snapshot);
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
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemBuilder: (context, index) {
        return DepartmentCard(snapshot.data.departments[index]);
      },
    );
  }

  /*goToMoviesDetailPage(ItemModel data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieDetailBlocProvider(
        child: 
        MovieDetailScreen(
          title: data.results[index].title,
          posterUrl: data.results[index].poster_path,
          description: data.results[index].overview,
          releaseDate: data.results[index].release_date,
          voteAverage: data.results[index].vote_average.toString(),
          movieId: data.results[index].id,
        ),
      );
    }));
  } */
}
