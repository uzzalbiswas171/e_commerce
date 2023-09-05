import 'package:ecommerceshope/Drawer/MyOrder/my_order.dart';
import 'package:ecommerceshope/LoginPage/login_screen.dart';
import 'package:ecommerceshope/Screen/AllProduct/all_product.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/category_page_demo.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerDemoPage extends StatelessWidget {
 DrawerDemoPage({Key? key,required this.addreess,required  this.name,required  this.phon,required  this.photo }) : super(key: key);
 String ? name,phon,photo ,addreess;
 final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 90,
            width: double.infinity,
            color: Color(0xff162C49).withOpacity(0.85),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    margin: EdgeInsets.only(
                      left: 12,
                      right: 13,
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("img/sh1.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ListTile(
                          title: Text(
                    box.read('name')==null ?"Your name":box.read('name'),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            box.read("phone")==null?"Enter your phone":box.read("phone"),
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'HOME',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.category,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'CATEGORIES',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPageAPI(),));
            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'SHOP',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => All_Product_Page(),));
            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_outlined,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'MY ACCOUNT',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.file_present,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'MY ORDERS',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => My_Order_Page(),));
            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'MY ADDRESS',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'MY FAVORITES',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.library_books,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'INTRO',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.radio,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
              'NEWS',
              style: TextStylee().MyTextStyle
            ),
            onTap: () {

            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              size:25,
              color: Color(0xff162C49).withOpacity(0.85),
            ),
            title: Text(
                'LOG OUT',
                style: TextStylee().MyTextStyle
            ),
            onTap: () {
              box.remove('token');
              box.remove('name');
              box.remove('phone');
              box.remove('photo');
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            },
          ),
          SizedBox(
            height: 10,
            child: Divider(endIndent: 5, thickness: 2),
          ),
        ],
      ),
    );
  }
}
class TextStylee{
  TextStyle MyTextStyle=GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: Color(0xff162C49).withOpacity(0.85),
  ) ;
}
