import 'package:met_art/models/department.dart';
import 'package:rxdart/rxdart.dart';
import 'package:met_art/resources/repository.dart';

class DepartmentsBloc {
  final _repository = Repository();
  final _departmentsFetcher = PublishSubject<DepartmentModel>();

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
    _departmentsFetcher?.close();
  }
}

final bloc = DepartmentsBloc();


  