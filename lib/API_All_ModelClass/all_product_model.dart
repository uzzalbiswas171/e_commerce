class AllProductModelClass {
  List<Data>? _data;

  AllProductModelClass({List<Data>? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  AllProductModelClass.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _code;
  int? _categoryId;
  int? _subCategoryId;
  String? _name;
  String? _price;
  Null? _discount;
  String? _mainImage;
  String? _smallImage;
  String? _thumbImage;
  String? _shortDetails;
  String? _description;
  String? _isDeal;
  String? _currencyAmount;

  Data(
      {int? id,
        String? code,
        int? categoryId,
        int? subCategoryId,
        String? name,
        String? price,
        Null? discount,
        String? mainImage,
        String? smallImage,
        String? thumbImage,
        String? shortDetails,
        String? description,
        String? isDeal,
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
  int? get subCategoryId => _subCategoryId;
  set subCategoryId(int? subCategoryId) => _subCategoryId = subCategoryId;
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
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get isDeal => _isDeal;
  set isDeal(String? isDeal) => _isDeal = isDeal;
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
