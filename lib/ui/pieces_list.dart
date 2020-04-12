import 'package:flutter/material.dart';
import 'package:met_art/blocs/pieces_bloc.dart';
import 'package:met_art/blocs/pieces_bloc_provider.dart';
import 'package:met_art/models/object_list.dart';
import 'package:met_art/models/department.dart';

class PiecesListScreen extends StatefulWidget {

  final int departmentId;
  final int total;

  PiecesListScreen({
    this.departmentId,
    this.total
  });

  @override
  _PiecesListScreenState createState() => _PiecesListScreenState();
}

class _PiecesListScreenState extends State<PiecesListScreen> {
  PiecesListBloc bloc;
  final List<String> objectList = List<String>();

  @override
  void didChangeDependencies() {
    bloc = PiecesListBlocProvider.of(context).bloc;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  "https://images.metmuseum.org/CRDImages/ad/original/DP258638.jpg",
                  fit: BoxFit.cover,
                )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 50.0,
                  alignment: WrapAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.total.toString(),
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),

                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.0, right: 1.0),
                    ),
                    Text(
                      widget.departmentId.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),

                StreamBuilder(
                  stream: bloc.piecesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder(
                        future: snapshot.data,
                        builder:
                            (context, AsyncSnapshot<ObjectList> snapshot) {
                          if (snapshot.hasData) {
                            return chipLayout(snapshot.data);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),

                // Chip(
                //   label: Text('Drama'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget chipLayout(ObjectList data) {
    List<Widget> children = List<Widget>();

    if (data.objectIDs.isNotEmpty) {
      var ids = data.objectIDs;
      for (var i = 0; i < ids.length; i++) {
        String name = ids[i].toString();
        print("Inside first loop");
        objectList.add(name);
      }

      for (var i = 0; i < objectList.length; i++) {
        print("Inside second loop");
        children.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(objectList[i]),
            ),
          ),
        ));
      }

      return Wrap(direction: Axis.horizontal, children: children);
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 80.0, right: 20.0),
        child: Text(
          'No Genres Found',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
      );
    }
  }

}
