import 'package:met_art/models/item_model.dart';
//import 'package:met_art/models/movie_detail.dart';
import 'pieces_api_provider.dart';
import 'dart:async';


class Repository {

  final PiecesApiProvider _movieApiProvider = PiecesApiProvider();

  
  Future<Result> fetchPiecesList() => _movieApiProvider.fetchPiecesList();

  //Future<ItemModel> fetchSimilarMovies(int movieId) => _movieApiProvider.fetchSimilarMovies(movieId);

  //Future<MovieDetail> fetchMovieDetail(int movieId) => _movieApiProvider.fetchMovieDetail(movieId);
  

}