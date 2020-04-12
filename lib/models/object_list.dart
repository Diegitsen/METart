class ObjectList {
  List<int> _objectIDs = [];
  int _total;

  ObjectList.fromJson(Map<String, dynamic> parsedJson) {
    _total = parsedJson['total'];
    List<int> temp = [];
    for (int i = 0; i < parsedJson['objectIDs'].length; i++) {
      int objectList = parsedJson['objectIDs'][i];
      temp.add(objectList);
    }
    _objectIDs = temp;
  }

  List<int> get objectIDs => _objectIDs;

  int get total => _total;

}
