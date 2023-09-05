import 'package:ecommerceshope/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SPlash_Screen_Page extends StatefulWidget {
  const SPlash_Screen_Page({Key? key}) : super(key: key);

  @override
  State<SPlash_Screen_Page> createState() => _SPlash_Screen_PageState();
}



class _SPlash_Screen_PageState extends State<SPlash_Screen_Page> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Ecommerce_Home_Page(),
          ));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/walpaper.jpg"), fit: BoxFit.fill)),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
          bottom: 50,
        ),
        child: Text(
          "Happy Shopping",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.italic,
            letterSpacing: 1,
            fontSize: 34,
            color: Colors.white54,
            fontWeight: FontWeight.w900,
          ),
          textAlign:TextAlign.center,
        ),
      ),
    );
  }
}
