import 'package:flutter/material.dart';
import 'package:met_art/blocs/pieces_bloc.dart';


class PiecesListBlocProvider extends InheritedWidget {

  final PiecesListBloc bloc;

  PiecesListBlocProvider({Key key, Widget child}) :bloc = PiecesListBloc(), super(key:key, child:child);

  static PiecesListBlocProvider of(BuildContext context) => 
    context.inheritFromWidgetOfExactType(PiecesListBlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}