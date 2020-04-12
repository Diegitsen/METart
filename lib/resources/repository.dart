import 'package:met_art/models/department.dart';
import 'package:met_art/models/object_list.dart';
//import 'package:met_art/models/movie_detail.dart';
import 'pieces_api_provider.dart';
import 'dart:async';

class Repository {
  final PiecesApiProvider _pieceApiProvider = PiecesApiProvider();

  //Future<Result> fetchPiecesList() => _movieApiProvider.fetchPiecesList();

  Future<DepartmentModel> fetchDepartmentsList() => _pieceApiProvider.fetchDepartmentList();

  //Future<ItemModel> fetchSimilarMovies(int movieId) => _movieApiProvider.fetchSimilarMovies(movieId);

  Future<ObjectList> fetchPiecesList(int departmentId) => _pieceApiProvider.fetchPiecesList(departmentId);

}
 