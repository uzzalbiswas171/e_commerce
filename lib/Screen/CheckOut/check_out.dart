import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
    CheckOutPage({Key? key,required this.getindex}) : super(key: key);
int getindex;


  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {



  @override
  Widget build(BuildContext context) {
    final alldatalist = Provider.of<AllProductProvider>(context).allproductlist;
    double rowsize=35;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "Order Summery",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height:80,
                    width: double.infinity,
                  //     color: Colors.orange,
                    child: Row(
                      children: [
                        Expanded(
                          flex:3,
                          child: Container(
                          child: Image.network("https://bornonbd.com/uploads/products/small/${alldatalist[widget.getindex].smallImage}",fit: BoxFit.fill, ),),),
                        Expanded(
                            flex:2,
                            child: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text("${alldatalist[widget.getindex].name}"))),
                        // Expanded(
                        //     flex:2,
                        //     child: Container(child: Text("${alldatalist[widget.getindex].id}"))),
                        Expanded(
                            flex:2,
                            child: Container(child: Text("${alldatalist[widget.getindex].price}"))),

                      ],
                    ),
                  ),
                  Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
                  Container(
                    height: rowsize,
                   width: double.infinity,
                    //   color: Colors.grey,
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal"),
                        Text("${alldatalist[widget.getindex].price}"),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
                  Container(
                    height: rowsize,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Trailoring Charge"),
                        Text("0.00"),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
                  Container(
                    height: rowsize,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Wrapping Charge"),
                        Text("0.00"),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
                  Container(
                    height: rowsize,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Charge"),
                        Text("0.00"),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height:1,indent: 1,color: Colors.black54,),
                  Container(
                    height: rowsize,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text("${alldatalist[widget.getindex].price}"),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text("Billing Address",style: GoogleFonts.poppins(fontSize: 18),),
            ),
            Container(
              
            )
          ],
        ),
      ),
    );
  }
}
