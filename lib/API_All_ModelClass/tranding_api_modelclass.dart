class Tranding_Model_Api {
  int? _currentPage;
  List<Null>? _data;
  String? _firstPageUrl;
  Null? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  Null? _nextPageUrl;
  String? _path;
  int? _perPage;
  Null? _prevPageUrl;
  Null? _to;
  int? _total;

  Tranding_Model_Api(
      {int? currentPage,
        List<Null>? data,
        String? firstPageUrl,
        Null? from,
        int? lastPage,
        String? lastPageUrl,
        List<Links>? links,
        Null? nextPageUrl,
        String? path,
        int? perPage,
        Null? prevPageUrl,
        Null? to,
        int? total}) {
    if (currentPage != null) {
      this._currentPage = currentPage;
    }
    if (data != null) {
      this._data = data;
    }
    if (firstPageUrl != null) {
      this._firstPageUrl = firstPageUrl;
    }
    if (from != null) {
      this._from = from;
    }
    if (lastPage != null) {
      this._lastPage = lastPage;
    }
    if (lastPageUrl != null) {
      this._lastPageUrl = lastPageUrl;
    }
    if (links != null) {
      this._links = links;
    }
    if (nextPageUrl != null) {
      this._nextPageUrl = nextPageUrl;
    }
    if (path != null) {
      this._path = path;
    }
    if (perPage != null) {
      this._perPage = perPage;
    }
    if (prevPageUrl != null) {
      this._prevPageUrl = prevPageUrl;
    }
    if (to != null) {
      this._to = to;
    }
    if (total != null) {
      this._total = total;
    }
  }

  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  List<Null>? get data => _data;
  set data(List<Null>? data) => _data = data;
  String? get firstPageUrl => _firstPageUrl;
  set firstPageUrl(String? firstPageUrl) => _firstPageUrl = firstPageUrl;
  Null? get from => _from;
  set from(Null? from) => _from = from;
  int? get lastPage => _lastPage;
  set lastPage(int? lastPage) => _lastPage = lastPage;
  String? get lastPageUrl => _lastPageUrl;
  set lastPageUrl(String? lastPageUrl) => _lastPageUrl = lastPageUrl;
  List<Links>? get links => _links;
  set links(List<Links>? links) => _links = links;
  Null? get nextPageUrl => _nextPageUrl;
  set nextPageUrl(Null? nextPageUrl) => _nextPageUrl = nextPageUrl;
  String? get path => _path;
  set path(String? path) => _path = path;
  int? get perPage => _perPage;
  set perPage(int? perPage) => _perPage = perPage;
  Null? get prevPageUrl => _prevPageUrl;
  set prevPageUrl(Null? prevPageUrl) => _prevPageUrl = prevPageUrl;
  Null? get to => _to;
  set to(Null? to) => _to = to;
  int? get total => _total;
  set total(int? total) => _total = total;

  Tranding_Model_Api.fromJson(Map<String, dynamic> json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = <Null>[];

    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = <Links>[];
      json['links'].forEach((v) {
        _links!.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = this._currentPage;

    data['first_page_url'] = this._firstPageUrl;
    data['from'] = this._from;
    data['last_page'] = this._lastPage;
    data['last_page_url'] = this._lastPageUrl;
    if (this._links != null) {
      data['links'] = this._links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this._nextPageUrl;
    data['path'] = this._path;
    data['per_page'] = this._perPage;
    data['prev_page_url'] = this._prevPageUrl;
    data['to'] = this._to;
    data['total'] = this._total;
    return data;
  }
}

class Links {
  String? _url;
  String? _label;
  bool? _active;

  Links({String? url, String? label, bool? active}) {
    if (url != null) {
      this._url = url;
    }
    if (label != null) {
      this._label = label;
    }
    if (active != null) {
      this._active = active;
    }
  }

  String? get url => _url;
  set url(String? url) => _url = url;
  String? get label => _label;
  set label(String? label) => _label = label;
  bool? get active => _active;
  set active(bool? active) => _active = active;

  Links.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this._url;
    data['label'] = this._label;
    data['active'] = this._active;
    return data;
  }
}
