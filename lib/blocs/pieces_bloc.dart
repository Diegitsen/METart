import 'dart:async';
import 'package:met_art/models/object_list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:met_art/resources/repository.dart';


class PiecesListBloc {

  final _repository = Repository();
  final _departmentId = PublishSubject<int>();
  final _piecesList = BehaviorSubject<Future<ObjectList>>();

  Function(int) get fetchMovieDetailById => _departmentId.sink.add;
  Stream<Future<ObjectList>> get piecesList => _piecesList.stream;




  PiecesListBloc() {
    _departmentId.stream.transform(_piecesListTransformer()).pipe(_piecesList);
  }

  dispose() async {
    _departmentId?.close();
    _piecesList?.close();
  }


  _piecesListTransformer() {
    return ScanStreamTransformer(
      (Future<ObjectList> piecesList, int id, int index) {
        print("DEP ID : $id");
        piecesList =_repository.fetchPiecesList(id);
        return piecesList;
      },
    );
  }

}

/*class PiecesBloc {
  final _repository = Repository();
  final _departmentId = PublishSubject<int>();
  final _piecesList = BehaviorSubject<Future<int>>();

  Function(int) get fetchPiecesById => _departmentId.sink.add;
  Observable<Future<int>> get piecesList => _piecesList.stream;

  PiecesBloc() {
    _departmentId.stream.transform(_movieDetailTransformer()).pipe(_piecesList);
  }

  dispose() async {
    _departmentId?.close();
    _piecesList?.close();
  }



  _piecesListTransformer() {
    return ScanStreamTransformer(
      (Future<int> piecesList) {
        print("MOVIE ID : $piecesList");
        piecesList = _repository.fetchPiecesList(piecesList);
        return piecesList;
      },
    );
  }
}*/
