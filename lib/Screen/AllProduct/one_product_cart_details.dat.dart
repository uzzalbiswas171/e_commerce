import 'package:ecommerceshope/CustomBootomNaviBar/custom_nav_bar.dart';
import 'package:ecommerceshope/Drawer/drawerdemo.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/LoginPage/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductCartDetails extends StatefulWidget {
  ProductCartDetails({Key? key, required this.getindex}) : super(key: key);
  int getindex;

  @override
  State<ProductCartDetails> createState() => _ProductCartDetailsState();
}

class _ProductCartDetailsState extends State<ProductCartDetails> {
  bool isFavorite = false;
  @override
  final _key = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    final alldatalist = Provider.of<AllProductProvider>(context).allproductlist;
    final oneproductprovider = Provider.of<AllProductProvider>(context);
    return Scaffold(
      key: _key,
      // drawer: DrawerDemoPage(),
      // endDrawer: EndDrawerPageDemo(),
      //  bottomNavigationBar: CustomNavigationBarPage(Home_color: Colors.amber.withOpacity(0.6), Produc_tColor: Colors.white, Category_color:Colors.amber.withOpacity(0.6), setting_Color:Colors.amber.withOpacity(0.6)),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          " Bornon ",
          style: GoogleFonts.poppins(
              letterSpacing: 1,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
        leading: IconButton(
            onPressed: () {
              //    _key.currentState!.openDrawer();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => LoginScreen(),
          //         ));
          //   },
          //   icon: Icon(
          //     Icons.account_circle_outlined,
          //     size: 30,
          //   ),
          // ),
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {
                      _key.currentState!.openEndDrawer();
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    )),
                Positioned(
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 9,
                      child: Consumer<AddtoCartProvider>(
                          builder: (context, value, child) {
                        return Text(
                          "${value.count.toString()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400),
                        );
                      }),
                    ))
              ],
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "https://bornonbd.com/uploads/products/original/${alldatalist[widget.getindex].mainImage}",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Container(
                          width: 120,
                          //   color: Colors.red,
                          height: double.infinity,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    EdgeInsets.only(top: 10, left: 10, right: 5),
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://bornonbd.com/uploads/products/thumbnail/${alldatalist[widget.getindex].thumbImage}"),
                                        fit: BoxFit.fill)),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "${alldatalist[widget.getindex].name}",
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    oneproductprovider.decreasesetcounnt();
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline_outlined,
                                    size: 20,
                                  )),
                              Text("${oneproductprovider.count}"),
                              IconButton(
                                  onPressed: () {
                                    oneproductprovider.increasesetcounnt();
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 20,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    //  height: 100,
                    width: double.infinity,
                    color: Colors.white,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Price : ৳, ${alldatalist[widget.getindex].price}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${alldatalist[widget.getindex].currencyAmount}",
                                      style: GoogleFonts.poppins(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                               // color: Colors.pinkAccent,
                                child: Text("Short details : ",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 200
                                ),
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                    endIndent: 1,
                                  indent: 1,
                                  color: Colors.black87,
                                ),
                              ),
                              //   Text("Price : ৳, ${alldatalist[widget.getindex].discoun}",style:GoogleFonts.poppins(fontSize: 18,),),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: 120,
                        //   height: double.infinity,
                        //   alignment:Alignment.topCenter,
                        //   color: Colors.red,
                        // )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    //     color: Color(0xff181423),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 50,
                            width: double.infinity,
                      //   color: Colors.indigoAccent[100],
                            child: Text(
                              Bidi.stripHtmlIfNeeded(
                                  "${alldatalist[widget.getindex].shortDetails},  shortDetails"),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            )),
                        Container(
                          width: double.infinity,
                      //    color: Colors.pinkAccent,
                          child: Text("Details : ",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 10,
                              right: 200
                          ),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            endIndent: 1,
                            indent: 1,
                            color: Colors.black87,
                          ),
                        ),
                        Container(

                            width: double.infinity,
                        //    color: Colors.lightGreen[100],
                            child: Text(
                                Bidi.stripHtmlIfNeeded(
                                    "${alldatalist[widget.getindex].description},  description"),
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ))),
                        Container(
                            height: 30,
                            width: double.infinity,
                         //   color: Colors.limeAccent[100],
                            child: Text(
                              "${alldatalist[widget.getindex].categoryId},  discount",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            )),
                        Container(
                            height: 30,
                            width: double.infinity,
                       //     color: Colors.lightBlueAccent[100],
                            child: Text(
                              "${alldatalist[widget.getindex].subCategoryId},  subCategoryId",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff8CC53E),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutPage(
                                getindex: widget.getindex,

                              ),
                            ));
                      },
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.9),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        alignment: Alignment.center,
                        child: Text(
                          "Check out",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xff8CC53E).withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                        )),
                    alignment: Alignment.center,
                    child: Text(
                      "Add to cart",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
