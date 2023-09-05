
import 'package:ecommerceshope/API_All_ModelClass/all_product_model.dart';
import 'package:ecommerceshope/API_Integration_All/for_all_product.dart';
import 'package:flutter/material.dart';

class AllProductProvider with ChangeNotifier{

  List<Data> allproductlist = [];

  getCategories(context) async {
    allproductlist = await CustomHttpRequest.getOrder(context);
    notifyListeners();
  }

  int _count=0;
  int get count=>_count;

  void increasesetcounnt(){
    _count++;
    notifyListeners();
  }
  void decreasesetcounnt(){
    _count--;
    notifyListeners();
  }

}