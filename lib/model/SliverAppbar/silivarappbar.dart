import 'package:ecommerceshope/LoginPage/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SliverAppsBarPage extends StatelessWidget {
  SliverAppsBarPage({Key? key,required this.onPressed,required this.Categorybutton}) : super(key: key);
    VoidCallback onPressed;
    VoidCallback Categorybutton;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xff415b75),
      pinned: true,
      flexibleSpace: Container(
        height: 50,
        width: double.infinity,
        //  color: Color(0xff415b75).withOpacity(0.4),
      ),
      floating: true,
      toolbarHeight: 50,
      leading: IconButton(
         onPressed:onPressed ,
          icon: Icon(
            Icons.menu,
            size: 25,
          )),
      title: Text(
        "Bornon",
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          wordSpacing: 2,
        ),
      ),

      actions: [
        IconButton(onPressed: () {

        }, icon: Icon(Icons.search,size: 30,),
        ),
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
        }, icon: Icon(Icons.account_circle_outlined,size: 30,),
        ),

        Container(

          alignment: Alignment.center,
          child: Stack(
            children: [
              IconButton(onPressed: Categorybutton, icon: Icon(Icons.shopping_cart,size: 30,)),
              Positioned(
             right: 8,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 9,
            child: Consumer<AddtoCartProvider>(builder: (context, value, child) {
            return Text("${value.count.toString()}",style: TextStyle(color: Colors.white,fontSize: 12,letterSpacing: 0,fontWeight: FontWeight.w400),);
            }),
          )
    )
            ],
          ),
        )
      ],
    );
  }
}
