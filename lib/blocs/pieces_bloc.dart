import 'package:met_art/models/department.dart';
import 'package:met_art/models/item_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:met_art/resources/repository.dart';

class PiecesBloc {
  final _repository = Repository();
  final _piecesFetcher = PublishSubject<Result>();
  final _departmentsFetcher = PublishSubject<DepartmentModel>();

  Stream<Result> get allPieces => _piecesFetcher.stream;
  Stream<DepartmentModel> get allDepartments => _departmentsFetcher.stream;

  /*fetchAllPieces() async {
    Result itemModel = await _repository.fetchPiecesList();
    _piecesFetcher.sink.add(itemModel);
  }*/

  fetchAllDepartments() async {
    DepartmentModel departmentModel = await _repository.fetchDepartmentsList();
    _departmentsFetcher.sink.add(departmentModel);
  }

  dispose() {
    //_piecesFetcher?.close();
    _departmentsFetcher?.close();
  }
}

final bloc = PiecesBloc();


  