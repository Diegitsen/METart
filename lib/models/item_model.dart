class ItemModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

class _Result {
  int _id;
  String _title;
  String _author;
  String _date;
  String _department;
  String _culture;
  String _period;
  String _primaryImage;

  _Result(result) {
    _id = result['objectID'];
    _title = result['title'];
    _author = result['artistDisplayName'];
    _date = result['artistDisplayBio'];
    _department = result['department'];
    _culture = result['culture'];
    _period = result['period'];
    _primaryImage = result['primaryImage'];
  }

  int get id => _id;

  String get title => _title;

  String get author => _author;

  String get date => _date;

  String get department => _department;

  String get culture => _culture;

  String get period => _period;

  String get primaryImage => _primaryImage;
}
