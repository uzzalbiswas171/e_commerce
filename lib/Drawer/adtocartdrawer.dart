import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';



class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
     final addtocarprovider=Provider.of<AdddTtoCartProvider>(context, listen: true);
     final addtocarproviderlist=Provider.of<AdddTtoCartProvider>(context, listen: true).favorit;
    // TODO: implement build
    return Drawer(

        child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount:addtocarproviderlist.length,
                  itemBuilder: (context, index) {
                    return Consumer<AdddTtoCartProvider>(builder: (context,value,child) {
                        return ListTile(
                          leading: Container(
                            height: 70,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("${value.cart[index].photo}"))
                            ),
                          ),
                          title: Text("${value!.cart[index].name}"),
                          subtitle: Text("${value.cart[index].price}"),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("THANKS FOR LIKE"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ])));
  }
}
