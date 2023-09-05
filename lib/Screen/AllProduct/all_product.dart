
import 'package:ecommerceshope/CustomBootomNaviBar/custom_nav_bar.dart';
import 'package:ecommerceshope/Drawer/drawerdemo.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/LoginPage/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/Screen/AllProduct/one_product_cart_details.dat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class All_Product_Page extends StatefulWidget {
  const All_Product_Page({Key? key}) : super(key: key);

  @override
  State<All_Product_Page> createState() => _All_Product_PageState();
}

class _All_Product_PageState extends State<All_Product_Page> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int isheart = 0;
  int valueee = 0;
  List dataList = [];
  ScrollController? _scrollController;
  @override
  void initState() {
    Provider.of<AllProductProvider>(context, listen: false)
        .getCategories(context,);
    _scrollController = ScrollController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    final alldatalist = Provider
        .of<AllProductProvider>(context)
        .allproductlist;
    // final cat = Provider.of<AllProductProvider>(context);
    return Scaffold(
      backgroundColor:  Colors.lightGreen[100] ,
      key: _key,
    //  drawer: DrawerDemoPage(),
      endDrawer: EndDrawerPageDemo(),
      bottomNavigationBar: CustomNavigationBarPage(Home_color: Colors.white, Produc_tColor: Colors.pinkAccent, Category_color:  Colors.white, setting_Color:  Colors.white),
      appBar: AppBar(
       centerTitle: true,
        title: Text(
          "All Product ",
          style: GoogleFonts.poppins(
              letterSpacing: 1,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
          leading: IconButton(
          onPressed: () {
            //    _key.currentState!.openDrawer();
            //  Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.blue,
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
        color: Colors.white.withOpacity(0.1),
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        margin: EdgeInsets.only(top: 10),
        child: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 260,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            crossAxisCount: 2,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: alldatalist.length,
                (context, index) {

              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCartDetails(
                    getindex: index,
                  ),));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 9,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Card(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage( "https://bornonbd.com/uploads/products/thumbnail/${alldatalist[index].thumbImage}",),fit: BoxFit.fill),
                              ),
                              alignment: Alignment.topRight,
                              child:Stack(
                                children: [
                                //  CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("${alldatalist[index].discount}"),),
                                  CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("25%"),),
                                ],
                              )
                            ),
                          ),
                        ),
                        Container(
                          // height: double.infinity,
                          // width: double.infinity,
                          //  color: Colors.red[900],
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container( width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${alldatalist[index].name}",style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400
                                    ),),
                                    // Text(Bidi.stripHtmlIfNeeded("${alldatalist[index].shortDetails}"),style: GoogleFonts.poppins(
                                    //     fontSize: 10,
                                    //     fontWeight: FontWeight.w400
                                    // ),) ,
                                  ],
                                ),
                              ),
                              Container(
                                height: 25,
                                width: double.infinity,
                                //     color: Colors.blue,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("৳ ${alldatalist[index].price}",style: TextStyle(fontSize: 12),),
                                    SizedBox(width: 10,),
                                    IconButton(onPressed: () {

                                    }, icon: Icon(Icons.favorite,size: 11,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),

    );
  }
}