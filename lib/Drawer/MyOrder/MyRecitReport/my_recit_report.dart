import 'package:ecommerceshope/Drawer/MyOrder/my_order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecitReportPage extends StatefulWidget {
  const RecitReportPage({Key? key}) : super(key: key);

  @override
  State<RecitReportPage> createState() => _RecitReportPageState();
}

class _RecitReportPageState extends State<RecitReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon:Icon(Icons.arrow_back),),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child:   Text(
                    "Sales Invoice",
                    style: CustomtEXTsTYLE().CustomTextStyleb,
                  ),)

                ],
              ),
            ),

            Container(
              height: 105,
              color: Colors.lightBlue[100],
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      //color: Colors.amberAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer ID: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Customer Name: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Address: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Contact no:01889173335",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      //   color: Colors.amberAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Invoice No: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Sale Date: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Served By: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(

              alignment: Alignment.center,
              //    color: Colors.lightBlue[100],
              color: Colors.lightBlue,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2),
                  children: [

                    TableRow(children: [
                      Column(children: [
                        Text('id', style: TextStyle(fontSize: 18.0))
                      ]),
                      Column(children: [
                        Text('Product name',
                            style: TextStyle(fontSize: 18.0))
                      ]),
                      Column(children: [
                        Text('Review', style: TextStyle(fontSize: 18.0))
                      ]),
                      Column(children: [
                        Text('Review', style: TextStyle(fontSize: 18.0))
                      ]),
                      Column(children: [
                        Text('Review', style: TextStyle(fontSize: 18.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('Flutter')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('MySQL')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('ReactJS')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('ReactJS')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('ReactJS')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('ReactJS')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('ReactJS')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),
                    TableRow(children: [
                      Column(children: [Text('Javatpoint')]),
                      Column(children: [Text('ReactJS')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                      Column(children: [Text('5*')]),
                    ]),

                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              // color: Colors.pink,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                       //     color: Colors.amberAccent,
                        ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      //      color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Invoice No: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Sale Date: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Served By: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black54,
                          ),
                          Text(
                            "Total Price: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Text(
                            "Paid: 12345",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black54,
                          ),
                          Text(
                            "Due: 123",
                            style: CustomtEXTsTYLE().CustomTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepOrange[200],
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Icon(Icons.download,size: 35,) ,
                  Text("Download",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),)
                ],
              )

              
            )

          ],
        ),
      ),
    );
  }
}

class CustomTextStyle {
  TextStyle customtextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
}

class CustomButtonTextStyle {
  TextStyle custombuttontextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.black54
  );
}
