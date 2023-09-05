

import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/SQFlite_Database/contact.dart';
import 'package:ecommerceshope/SQFlite_Database/dbconnectpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EndDrawerPageDemo extends StatefulWidget {
  EndDrawerPageDemo({Key? key, }) : super(key: key);

  @override
  State<EndDrawerPageDemo> createState() => _EndDrawerPageDemoState();
}

class _EndDrawerPageDemoState extends State<EndDrawerPageDemo> {
  List productlistimg = [
    "img/s1.jpg",
  ];

  List productlistname = [
    "LAXMN TECH SUEDE",
    "CLASSIC FIT COTTON POLO",
    "APEX CASE SHOO",
    "CLASSIC FIT COTTON POLO",
    "LAXMN TECH SUEDE",
    "CLASSIC FIT COTTON POLO",
    "APEX CASE SHOO",
  ];

  @override
  Widget build(BuildContext context) {
    final addtocarprovider=Provider.of<AdddTtoCartProvider>(context, listen: true);
    final addtocarproviderlist=Provider.of<AdddTtoCartProvider>(context, listen: true).cart;
    // TODO: implement build
    return Drawer(

        child: addtocarproviderlist.length == 0
            ? Center(
          child: Text("No items in Cart"),
        )
            : Container(
            padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount:addtocarprovider.total,
                  itemBuilder: (context, index) {
                    return Consumer<AdddTtoCartProvider>(builder: (context,value,child) {
                      return Card(
                        color: Colors.purpleAccent.shade400.withOpacity(0.4),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage("${value.cart[index].photo}"))
                            ),
                          ),
                          title: Text("${value!.cart[index].name}"),
                          // subtitle: Text(value.cart[index].qty.toString() +
                          //     " x " +
                          //     value.cart[index].price.toString() +
                          //     " = " +
                          //     ("${value.cart[index].qty}")
                          //         .toString()),
                          subtitle: Text("${value.cart[index].price}"),

                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: () {
                                    value.updateProduct(value.cart[index],
                                        value.cart[index].qty! + 1);
                                    // model.removeProduct(model.cart[index]);
                                  },
                                ),
                                Text("${value.cart[index].qty}"),
                                IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {
                                    value.updateProduct(value.cart[index],
                                        value.cart[index].qty! - 1);
                                    // model.removeProduct(model.cart[index]);
                                  },
                                ),
                              ]),
                        ),
                      );
                    },
                    );
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Total: \$ " +
                        Provider.of<AdddTtoCartProvider>(context,
                            listen: true)
                            .totalCartValue
                            .toString() +
                        "",
                    style: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(

                    child: Text("BUY NOW"),
                    onPressed: () {},
                  )),






            ])));
  }
}
