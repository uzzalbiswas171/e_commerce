class NewArivel {
  int? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  Null? _nextPageUrl;
  String? _path;
  int? _perPage;
  Null? _prevPageUrl;
  int? _to;
  int? _total;

  NewArivel(
      {int? currentPage,
        List<Data>? data,
        String? firstPageUrl,
        int? from,
        int? lastPage,
        String? lastPageUrl,
        List<Links>? links,
        Null? nextPageUrl,
        String? path,
        int? perPage,
        Null? prevPageUrl,
        int? to,
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
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  String? get firstPageUrl => _firstPageUrl;
  set firstPageUrl(String? firstPageUrl) => _firstPageUrl = firstPageUrl;
  int? get from => _from;
  set from(int? from) => _from = from;
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
  int? get to => _to;
  set to(int? to) => _to = to;
  int? get total => _total;
  set total(int? total) => _total = total;

  NewArivel.fromJson(Map<String, dynamic> json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = <Links>[];
      json['links'].forEach((v) {
        _links!.add(new Links.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this._currentPage;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
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

class Data {
  int? _id;
  String? _code;
  int? _categoryId;
  Null? _subCategoryId;
  String? _name;
  String? _price;
  Null? _discount;
  String? _mainImage;
  String? _smallImage;
  String? _thumbImage;
  String? _shortDetails;
  Null? _description;
  Null? _isDeal;
  String? _currencyAmount;

  Data(
      {int? id,
        String? code,
        int? categoryId,
        Null? subCategoryId,
        String? name,
        String? price,
        Null? discount,
        String? mainImage,
        String? smallImage,
        String? thumbImage,
        String? shortDetails,
        Null? description,
        Null? isDeal,
        String? currencyAmount}) {
    if (id != null) {
      this._id = id;
    }
    if (code != null) {
      this._code = code;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (subCategoryId != null) {
      this._subCategoryId = subCategoryId;
    }
    if (name != null) {
      this._name = name;
    }
    if (price != null) {
      this._price = price;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (mainImage != null) {
      this._mainImage = mainImage;
    }
    if (smallImage != null) {
      this._smallImage = smallImage;
    }
    if (thumbImage != null) {
      this._thumbImage = thumbImage;
    }
    if (shortDetails != null) {
      this._shortDetails = shortDetails;
    }
    if (description != null) {
      this._description = description;
    }
    if (isDeal != null) {
      this._isDeal = isDeal;
    }
    if (currencyAmount != null) {
      this._currencyAmount = currencyAmount;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get code => _code;
  set code(String? code) => _code = code;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  Null? get subCategoryId => _subCategoryId;
  set subCategoryId(Null? subCategoryId) => _subCategoryId = subCategoryId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get price => _price;
  set price(String? price) => _price = price;
  Null? get discount => _discount;
  set discount(Null? discount) => _discount = discount;
  String? get mainImage => _mainImage;
  set mainImage(String? mainImage) => _mainImage = mainImage;
  String? get smallImage => _smallImage;
  set smallImage(String? smallImage) => _smallImage = smallImage;
  String? get thumbImage => _thumbImage;
  set thumbImage(String? thumbImage) => _thumbImage = thumbImage;
  String? get shortDetails => _shortDetails;
  set shortDetails(String? shortDetails) => _shortDetails = shortDetails;
  Null? get description => _description;
  set description(Null? description) => _description = description;
  Null? get isDeal => _isDeal;
  set isDeal(Null? isDeal) => _isDeal = isDeal;
  String? get currencyAmount => _currencyAmount;
  set currencyAmount(String? currencyAmount) =>
      _currencyAmount = currencyAmount;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _code = json['code'];
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _name = json['name'];
    _price = json['price'];
    _discount = json['discount'];
    _mainImage = json['main_image'];
    _smallImage = json['small_image'];
    _thumbImage = json['thumb_image'];
    _shortDetails = json['short_details'];
    _description = json['description'];
    _isDeal = json['is_deal'];
    _currencyAmount = json['currency_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['code'] = this._code;
    data['category_id'] = this._categoryId;
    data['sub_category_id'] = this._subCategoryId;
    data['name'] = this._name;
    data['price'] = this._price;
    data['discount'] = this._discount;
    data['main_image'] = this._mainImage;
    data['small_image'] = this._smallImage;
    data['thumb_image'] = this._thumbImage;
    data['short_details'] = this._shortDetails;
    data['description'] = this._description;
    data['is_deal'] = this._isDeal;
    data['currency_amount'] = this._currencyAmount;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    data['label'] = this._label;
    data['active'] = this._active;
    return data;
  }
}
