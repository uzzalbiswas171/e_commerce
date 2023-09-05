
import 'package:ecommerceshope/BootomNavigationBar/bootom_navigation_bar.dart';
import 'package:ecommerceshope/Drawer/adtocartdrawer.dart';
import 'package:ecommerceshope/LoginPage/login_screen.dart';
import 'package:ecommerceshope/Screen/AllProduct/all_product.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/category_page_demo.dart';
import 'package:ecommerceshope/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomNavigationBarPage extends StatelessWidget {
  CustomNavigationBarPage({Key? key,required this.Home_color, required this.Produc_tColor, required this.Category_color, required this.setting_Color  }) : super(key: key);
  @override
  final Color? Home_color,Produc_tColor,Category_color,setting_Color;
  Widget build(BuildContext context) {
  // TextStyle optionStyle =
  //   GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold);
    return Container(
      color: Color(0xff5100AB),
      height: 60,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Ecommerce_Home_Page(),));
            },
            child: Container(
        width: 90,
        margin: EdgeInsets.only(
            left:7,
        ),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Icon( Icons.home,size: 22,color:Home_color,),
              Text('Home',style:  GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,color: Home_color),) ,
            ],
        ),
      ),
          ),
          InkWell(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => All_Product_Page(),));
            },
            child: Container(
              width: 90,
              margin: EdgeInsets.only(
                left:7,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Icon( Icons.production_quantity_limits,size: 22,color: Produc_tColor,),
                  Text('Product',style:  GoogleFonts.poppins(color:Produc_tColor,fontSize: 16, fontWeight: FontWeight.w500),) ,
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPageAPI(),));
            },
            child: Container(
              width: 90,
              margin: EdgeInsets.only(
                left:7,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Icon( Icons.category,size: 22,color: Category_color,),
                  Text('Category',style:  GoogleFonts.poppins(color:Category_color,fontSize: 16, fontWeight: FontWeight.w500),) ,
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
            },
            child: Container(
              width: 90,
              margin: EdgeInsets.only(
                left:7,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Icon( Icons.favorite,size: 22,color: setting_Color,),
                  Text('Like',style:  GoogleFonts.poppins(color:setting_Color,fontSize: 16, fontWeight: FontWeight.w500),) ,
                ],
              ),
            ),
          ),

        ],
      )
    );
  }
}