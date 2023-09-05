import 'package:ecommerceshope/API_All_ModelClass/all_product_model.dart';
import 'package:ecommerceshope/API_Integration_All/for_all_product.dart';
import 'package:flutter/cupertino.dart';

class AdddTtoCartProvider with ChangeNotifier{



   List<Product> cart = [];
   List<Product> favorit = [];
  double totalCartValue = 0;

  int get total => cart.length;
  int get favorite => favorit.length;



  void addProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    print(index);
    if (index != -1)
      updateProduct(product, product.qty + 1);
    else {
      cart.add(product);
      calculateTotal();
      notifyListeners();
    }
  }

   void addfavorite(product) {
     int index = favorit.indexWhere((i) => i.id == product.id);
     print(index);
     if (index != -1)
       updateProduct(product, product.qty + 1);
     else {
       favorit.add(product);
       calculateTotal();
       notifyListeners();
     }
   }


  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0)
      removeProduct(product);

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price! * f.qty!;
    });
  }
}


class Product {
  int ? id;
  String? name;
  String ?photo;
  double ?price;
  int ? qty;

  Product({this.id, this.name, this.price, this.qty, this.photo});
}

