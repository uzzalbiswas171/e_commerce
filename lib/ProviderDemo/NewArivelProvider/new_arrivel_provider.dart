


import 'package:ecommerceshope/API_Integration_All/for_new_arrivel.dart';
import 'package:flutter/cupertino.dart';

import '../../API_All_ModelClass/newarrivel_model_data.dart';

class NewArrivelProvider with ChangeNotifier{

  List<Data> newarrivel=[];
    getNewarrivelproduct(context) async {
  //   newarrivel = await CustomHttpRequest().getOrder(context);
    notifyListeners();
  }
}