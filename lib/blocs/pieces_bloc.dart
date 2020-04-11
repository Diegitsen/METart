import 'package:met_art/models/item_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:met_art/resources/repository.dart';

class PiecesBloc {

  final _repository = Repository();
  final _piecesFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allPieces => _piecesFetcher.stream;

  fetchAllPieces() async {
    ItemModel itemModel = await _repository.fetchPiecesList();
    _piecesFetcher.sink.add(itemModel); 
  }

  dispose() {
    _piecesFetcher?.close();
  }
}

final bloc = PiecesBloc();