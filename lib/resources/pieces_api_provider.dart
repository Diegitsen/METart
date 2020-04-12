import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:met_art/models/department.dart';
import 'dart:convert';

import 'package:met_art/models/object_list.dart';

class PiecesApiProvider {
  http.Client client = http.Client();
  final _baseUrl = "https://collectionapi.metmuseum.org/public/collection/v1";

  Future<DepartmentModel> fetchDepartmentList() async {
    final response = await client.get("$_baseUrl/departments");
    print(response.body.toString());
    if (response.statusCode == 200) {
      print("Inside 200 status code");
      return DepartmentModel.fromJson(json.decode(response.body));
    } else {
      print("Status code : ${response.statusCode}");
      throw Exception('Failed to load pieces list');
    }
  }

  Future<ObjectList> fetchPiecesList(int departmentId) async {
    final response = await client.get(
        "$_baseUrl/search?departmentId=$departmentId&hasImages=true&isHighlight=true&q=art");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ObjectList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve Movie Detail');
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
