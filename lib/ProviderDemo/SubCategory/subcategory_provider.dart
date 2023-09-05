import 'package:ecommerceshope/API_All_ModelClass/all_category_model_class.dart';
import 'package:ecommerceshope/API_Integration_All/for_all_category.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/category_page_demo.dart';
import 'package:flutter/cupertino.dart';

class Sub_Category_Provider with ChangeNotifier{
  List<Data> allproductlist = [];

  getCategories(context) async {
    allproductlist = await CustomHttprequesttt.fetchUsers();
    notifyListeners();
  }

}