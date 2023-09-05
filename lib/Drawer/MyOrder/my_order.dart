import 'package:ecommerceshope/Drawer/MyOrder/MyRecitReport/my_recit_report.dart';
import 'package:ecommerceshope/model/LeadingModel/leading_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class My_Order_Page extends StatefulWidget {
  My_Order_Page({Key? key}) : super(key: key);

  @override
  State<My_Order_Page> createState() => _My_Order_PageState();
}

class _My_Order_PageState extends State<My_Order_Page> {
  int xz = 0;
  double hightt = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Orders",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: LeaadingButton(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.indigoAccent[100],
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecitReportPage(),
                      ));
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: hightt,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: hightt,
                          width: double.infinity,
                          color: Colors.green[100],
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Invoice number: 12345",
                                    style: CustomtEXTsTYLE().CustomTextStyle),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text("Order Date: 12345",
                                    style: CustomtEXTsTYLE().CustomTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: hightt,
                          width: double.infinity,
                          color: Colors.green[100],
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Status: 576554",
                                    style: CustomtEXTsTYLE().CustomTextStyle),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text("Amount: 12345",
                                    style: CustomtEXTsTYLE().CustomTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomtEXTsTYLE {
  final TextStyle? CustomTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final TextStyle? CustomTextStyleb = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}
