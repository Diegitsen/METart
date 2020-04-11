import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:met_art/models/item_model.dart';
import 'dart:convert';



class PiecesApiProvider {

  http.Client client = http.Client();
  final _baseUrl = "https://collectionapi.metmuseum.org/public/collection/v1";

  Future<Result> fetchPiecesList() async {
    final response = await client.get("$_baseUrl/objects/1010");
    print(response.body.toString());
    if (response.statusCode == 200) {
      print("Inside 200 status code");
      return Result.fromJson(json.decode(response.body));
    } else {
      print("Status code : ${response.statusCode}");
       throw Exception('Failed to load pieces list');
    } 
  }

  /*Future<MovieDetail> fetchMovieDetail(int movieId) async {
    final response = await client.get("$_baseUrl/$movieId?api_key=$_apiKey");
    print(response.body.toString());
    if(response.statusCode == 200) {
      return MovieDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve Movie Detail');
    }
  }*/

  /*Future<ItemModel> fetchSimilarMovies(int movieId) async {
    final response = await client.get("$_baseUrl/$movieId/similar?api_key=$_apiKey");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error retrieving similar movies details');
    }

  } */

}