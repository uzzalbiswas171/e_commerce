

import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:ecommerceshope/Screen/AllProduct/one_product_cart_details.dat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../API_All_ModelClass/newarrivel_model_data.dart';

class NewArrivelPage extends StatefulWidget {
  const NewArrivelPage({Key? key, }) : super(key: key);



  @override
  State<NewArrivelPage> createState() => _NewArrivelPageState();
}


class _NewArrivelPageState extends State<NewArrivelPage> {
    List<Data> dataList = [];
//  getallnewarrivveldata(context) async {
//   Data data;
//
//   try {
//     String link = "https://bornonbd.com/api/category-wise-product/7";
//     var response = await http.get(
//         Uri.parse(link),
//     );
//     print(response.statusCode);
//
//     if (response.statusCode == 200) {
//     //  var getUsersData = response.body["data"] as List;
//       final item = json.decode(response.body);
//       print(item);
//       Data datainstance;
//       for (var i in item["data"]["data"]) {
//         datainstance = Data.fromJson(i);
//         dataList.add(datainstance);
// // print("orders: $dataList");
//       }
//     }
//   } catch (e) {
//     print(e);
//   }
//   return dataList;
// }
//   @override
//   void initState() {
//     getallnewarrivveldata(context);
//    // dataList =CustomHttpRequest().getOrder(context);
//   //  NewArrivelProvider().getNewarrivelproduct(context);
//     // TODO: implement initState
//     super.initState();
//   }


  fetchUsers() async {
    try {
      Response response = await Dio().get("https://bornonbd.com/api/category-wise-product/7");
      print(response.statusCode);
      if (response.statusCode == 200) {
        var getUsersData = response.data["data"]["data"] as List;
        var  listUsers = getUsersData.map((data) => Data.fromJson(data)).toList();
        print(listUsers);
        return listUsers;
      } else {
        throw Exception("‘Failed to load users’");
      }
    } catch (e) {
      print(e);
    }
  }
  Future<dynamic>? listUsers;

  @override
  void initState() {
    // NewArrivelProvider().getNewarrivelproduct(context);
    listUsers= fetchUsers();
    super.initState();

  }






  @override
  Widget build(BuildContext context) {
   // final new_arrivelList=Provider.of<NewArrivelProvider>(context).newarrivel;
    return Scaffold(
      appBar: AppBar(),



      body: SafeArea(
        child: FutureBuilder (
          future: listUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 300,
                  crossAxisCount: 2),
                itemCount: 5,
                itemBuilder: (context, index) {
                  var user = (snapshot.data as List<Data>)[index];
                  return Card(
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {

                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 5,right: 5),

                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Card(
                                child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(image: NetworkImage( "https://bornonbd.com/uploads/products/thumbnail/${user.thumbImage}",),fit: BoxFit.fill),
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
                                        Text("${user.name}",style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400
                                        ),),
                                        Text("${user.shortDetails}",style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400
                                        ),) ,
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: double.infinity,
                                    //     color: Colors.blue,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("৳ ${user.id}",style: TextStyle(fontSize: 12),),
                                        SizedBox(width: 10,),
                                        //    Text("\$ ${user.status}",style: TextStyle(fontSize: 12)),
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
                },);
              // return ListView.separated(
              //     itemBuilder: (context, index) {
              //       var user = (snapshot.data as List<Data>)[index];
              //       return Container(
              //         padding: EdgeInsets.only(left: 20,right: 20),
              //         height: 250,
              //         width: double.infinity,
              //         child: Column(
              //           children: [
              //             Expanded(
              //               flex: 7,
              //               child: Card(
              //                 child: Container(
              //                     height: double.infinity,
              //                     width: double.infinity,
              //                     decoration: BoxDecoration(
              //                       color: Colors.black54,
              //                       image: DecorationImage(image: NetworkImage( "https://bornonbd.com/uploads/category/original/${user.image}",),fit: BoxFit.fill),
              //                     ),
              //                     alignment: Alignment.topRight,
              //                     child:Stack(
              //                       children: [
              //                         //  CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("${alldatalist[index].discount}"),),
              //                         CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("25%"),),
              //                       ],
              //                     )
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               // height: double.infinity,
              //               // width: double.infinity,
              //               //  color: Colors.red[900],
              //               padding: EdgeInsets.only(
              //                   left: 5, right: 5, top: 5
              //               ),
              //               alignment: Alignment.center,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Container( width: double.infinity,
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text("${user.name}",style: GoogleFonts.poppins(
              //                             fontSize: 12,
              //                             fontWeight: FontWeight.w400
              //                         ),),
              //                         Text("${user.details}",style: GoogleFonts.poppins(
              //                             fontSize: 10,
              //                             fontWeight: FontWeight.w400
              //                         ),) ,
              //                       ],
              //                     ),
              //                   ),
              //                   Container(
              //                     height: 25,
              //                     width: double.infinity,
              //                     //     color: Colors.blue,
              //                     alignment: Alignment.center,
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       children: [
              //                         Text("৳ ${user.id}",style: TextStyle(fontSize: 12),),
              //                         SizedBox(width: 10,),
              //                         //    Text("\$ ${user.status}",style: TextStyle(fontSize: 12)),
              //                         IconButton(onPressed: () {
              //
              //                         }, icon: Icon(Icons.favorite,size: 11,)),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       );
              //     },
              //     separatorBuilder: (context, index) {
              //       return Divider();
              //     },
              //     itemCount: (snapshot.data as List<Data>).length);




            } else if (snapshot.hasError) {
              return Center( child: Text("${snapshot.error}"));
            }
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
            );
          },
        ),
      ),




















      // body:Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   color: Colors.white.withOpacity(0.1),
      //   padding: EdgeInsets.only(
      //     left: 10,
      //     right: 10,
      //   ),
      //   margin: EdgeInsets.only(top: 10),
      //   child: GridView.custom(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       mainAxisExtent: 260,
      //       mainAxisSpacing: 2,
      //       crossAxisSpacing: 2,
      //       crossAxisCount: 2,
      //     ),
      //     childrenDelegate: SliverChildBuilderDelegate(
      //       childCount: dataList.length,
      //           (context, index) {
      //
      //         return InkWell(
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCartDetails(
      //               getindex: index,
      //             ),));
      //           },
      //           child: Card(
      //             color: Colors.white,
      //             elevation: 9,
      //             shape: RoundedRectangleBorder(
      //               side: BorderSide(color: Colors.white70, width: 1),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: Container(
      //               child: Column(
      //                 children: [
      //                   Expanded(
      //                     flex: 7,
      //                     child: Card(
      //                       child: Container(
      //                           height: double.infinity,
      //                           width: double.infinity,
      //                           decoration: BoxDecoration(
      //                             color: Colors.red,
      //                             image: DecorationImage(image: NetworkImage( "https://bornonbd.com/uploads/products/original/${dataList[index].mainImage}",),fit: BoxFit.fill),
      //                           ),
      //                           alignment: Alignment.topRight,
      //                           child:Stack(
      //                             children: [
      //                             CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("25"),),
      //                               //    CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("${index}"),),
      //                             ],
      //                           )
      //                       ),
      //                     ),
      //                   ),
      //                   Container(
      //                     // height: double.infinity,
      //                     // width: double.infinity,
      //                     //  color: Colors.red[900],
      //                     padding: EdgeInsets.only(
      //                         left: 5, right: 5, top: 5
      //                     ),
      //                     alignment: Alignment.center,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Container( width: double.infinity,
      //                           child: Column(
      //                             mainAxisAlignment: MainAxisAlignment.start,
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text("${dataList[index].name}",style: GoogleFonts.poppins(
      //                                   fontSize: 12,
      //                                   fontWeight: FontWeight.w400
      //                               ),),
      //                               Text(Bidi.stripHtmlIfNeeded("${dataList[index].shortDetails}"),style: GoogleFonts.poppins(
      //                                   fontSize: 10,
      //                                   fontWeight: FontWeight.w400
      //                               ),) ,
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                           height: 25,
      //                           width: double.infinity,
      //                           //     color: Colors.blue,
      //                           alignment: Alignment.center,
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Text("৳ ${dataList[index].price}",style: TextStyle(fontSize: 12),),
      //                               SizedBox(width: 10,),
      //                               Text("\$ ${dataList[index].currencyAmount}",style: TextStyle(fontSize: 12)),
      //                               IconButton(onPressed: () {
      //
      //                               }, icon: Icon(Icons.favorite,size: 11,)),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
