import 'package:flutter/material.dart';
//import 'package:met_art/blocs/movie_detail_bloc_provider.dart';
//import 'package:met_art/ui/movie_detail.dart';
import '../blocs/pieces_bloc.dart';
import 'package:met_art/models/item_model.dart';

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
    bloc.fetchAllPieces();
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
        stream: bloc.allPieces,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
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

  Widget buildList(AsyncSnapshot<Result> snapshot) {
    return GridView.builder(
      itemCount: 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: InkResponse(
            splashColor: Colors.red,
            enableFeedback: true,
            child: Image.network(
              //snapshot.data.results[index].primaryImage,
              snapshot.data.primaryImage,
              fit: BoxFit.cover,
            ),
            onTap: () => {
              print("On tap yeiii")
            }//goToMoviesDetailPage(snapshot.data, index),
          ),
        );
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
