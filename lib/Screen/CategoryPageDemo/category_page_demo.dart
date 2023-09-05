
import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/all_category_model_class.dart';
import 'package:ecommerceshope/API_Integration_All/for_new_arrivel.dart';
import 'package:ecommerceshope/CustomBootomNaviBar/custom_nav_bar.dart';
import 'package:ecommerceshope/Drawer/drawerdemo.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/ProviderDemo/CategoryProvider/category_provider.dart';
import 'package:ecommerceshope/ProviderDemo/NewArivelProvider/new_arrivel_provider.dart';
import 'package:ecommerceshope/ProviderDemo/SubCategory/subcategory_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/new_arrivel_page.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class CategoryPageAPI extends StatefulWidget {
  const CategoryPageAPI({Key? key}) : super(key: key);

  @override
  State<CategoryPageAPI> createState() => _CategoryPageAPIState();



}

class _CategoryPageAPIState extends State<CategoryPageAPI> {
  List<Data> categolylist=[];

  // getCategoryDAta()async{
  //   try{
  //     var link="${BaseURL}category";
  //     var response=await http.get(Uri.parse(link));
  //     print(response.statusCode);
  //     if(response.statusCode==200){
  //       var categorydata=jsonDecode(response.body);
  //       Data data;
  //       for(var i in categorydata["data"]){
  //         data=Data.fromJson(i);
  //         categolylist.add(data);
  //       }
  //     }
  //   }catch(error){print("CategoryData error from api $error");}
  //   return categolylist;
  // }

  //
  // static fetchUsers() async {
  //   try {
  //     Response response = await Dio().get("https://bornonbd.com/api/category-with-subcategory");
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       var getUsersData = response.data["data"] as List;
  //    var  listUsers = getUsersData.map((data) => Data.fromJson(data)).toList();
  //       print(listUsers);
  //       return listUsers;
  //     } else {
  //   throw Exception("‘Failed to load users’");
  //   }
  //   } catch (e) {
  //   print(e);
  //   }
  // }
  //  Future<dynamic>? listUsers;

  @override
  void initState() {

   // listUsers= fetchUsers();

    Provider.of<Sub_Category_Provider>(context, listen: false)
        .getCategories(context,);
    super.initState();

  }





   int ? categoryindex=0;
  final _key=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final alldatalist = Provider
        .of<Sub_Category_Provider>(context)
        .allproductlist;
    final cat = Provider.of<Sub_Category_Provider>(context);
    return Scaffold(
        key: _key,
        endDrawer: EndDrawerPageDemo(),
      bottomNavigationBar: CustomNavigationBarPage(Home_color: Colors.white, Produc_tColor: Colors.white, Category_color:  Colors.pinkAccent, setting_Color:  Colors.white),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Category ",
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
        body: SafeArea(
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 270,
            crossAxisCount: 2),
      itemCount: alldatalist.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                categoryindex=index;
              });
              if(categoryindex==index){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryPageDemo(

                  subCategoryindex: index,

                ),));
              }


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
                            image: DecorationImage(image: NetworkImage( "https://bornonbd.com/uploads/category/original/${alldatalist[index].image}",),fit: BoxFit.fill),
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
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${alldatalist[index].name}",style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),),
                              // Text("${alldatalist[index].details}",style: GoogleFonts.poppins(
                              //     fontSize: 10,
                              //     fontWeight: FontWeight.w400
                              // ),) ,
                            ],
                          ),
                        ),
                        // Container(
                        //   height: 30,
                        //   width: double.infinity,
                        //   //     color: Colors.blue,
                        //   alignment: Alignment.center,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Text("৳ ${alldatalist[index].id}",style: TextStyle(fontSize: 12),),
                        //       SizedBox(width: 10,),
                        //       //    Text("\$ ${user.status}",style: TextStyle(fontSize: 12)),
                        //       IconButton(onPressed: () {
                        //
                        //       }, icon: Icon(Icons.favorite,size: 11,)),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },),
        ),
    );
  }
}


//
// child: FutureBuilder (
// future: listUsers,
// builder: (context, snapshot) {
// if (snapshot.hasData) {
//
// return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// mainAxisExtent: 300,
// crossAxisCount: 2),
// itemCount: (snapshot.data.length),
// itemBuilder: (context, index) {
// var user = (snapshot.data as List<Data>)[index];
// return Card(
// elevation: 9,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// child: InkWell(
// onTap: () {
// setState(() {
// categoryindex=index;
// });
// if(categoryindex==index){
// Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryPageDemo(
//
// subCategoryindex: index,
//
// ),));
// }
//
//
// },
// child: Container(
// padding: EdgeInsets.only(left: 5,right: 5),
//
// width: double.infinity,
// child: Column(
// children: [
// Expanded(
// flex: 7,
// child: Card(
// child: Container(
// height: double.infinity,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.circular(15),
// image: DecorationImage(image: NetworkImage( "https://bornonbd.com/uploads/category/original/${user.image}",),fit: BoxFit.fill),
// ),
// alignment: Alignment.topRight,
// child:Stack(
// children: [
// //  CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("${alldatalist[index].discount}"),),
// CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("25%"),),
// ],
// )
// ),
// ),
// ),
// Container(
// // height: double.infinity,
// // width: double.infinity,
// //  color: Colors.red[900],
// padding: EdgeInsets.only(
// left: 5, right: 5, top: 5
// ),
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container( width: double.infinity,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("${user.name}",style: GoogleFonts.poppins(
// fontSize: 12,
// fontWeight: FontWeight.w400
// ),),
// Text("${user.details}",style: GoogleFonts.poppins(
// fontSize: 10,
// fontWeight: FontWeight.w400
// ),) ,
// ],
// ),
// ),
// Container(
// height: 30,
// width: double.infinity,
// //     color: Colors.blue,
// alignment: Alignment.center,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text("৳ ${user.id}",style: TextStyle(fontSize: 12),),
// SizedBox(width: 10,),
// //    Text("\$ ${user.status}",style: TextStyle(fontSize: 12)),
// IconButton(onPressed: () {
//
// }, icon: Icon(Icons.favorite,size: 11,)),
// ],
// ),
// ),
// ],
// ),
// )
// ],
// ),
// ),
// ),
// );
// },);
// // return ListView.separated(
// //     itemBuilder: (context, index) {
// //       var user = (snapshot.data as List<Data>)[index];
// //       return Container(
// //         padding: EdgeInsets.only(left: 20,right: 20),
// //         height: 250,
// //         width: double.infinity,
// //         child: Column(
// //           children: [
// //             Expanded(
// //               flex: 7,
// //               child: Card(
// //                 child: Container(
// //                     height: double.infinity,
// //                     width: double.infinity,
// //                     decoration: BoxDecoration(
// //                       color: Colors.black54,
// //                       image: DecorationImage(image: NetworkImage( "https://bornonbd.com/uploads/category/original/${user.image}",),fit: BoxFit.fill),
// //                     ),
// //                     alignment: Alignment.topRight,
// //                     child:Stack(
// //                       children: [
// //                         //  CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("${alldatalist[index].discount}"),),
// //                         CircleAvatar(backgroundColor: Colors.red,radius: 20,child: Text("25%"),),
// //                       ],
// //                     )
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               // height: double.infinity,
// //               // width: double.infinity,
// //               //  color: Colors.red[900],
// //               padding: EdgeInsets.only(
// //                   left: 5, right: 5, top: 5
// //               ),
// //               alignment: Alignment.center,
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Container( width: double.infinity,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text("${user.name}",style: GoogleFonts.poppins(
// //                             fontSize: 12,
// //                             fontWeight: FontWeight.w400
// //                         ),),
// //                         Text("${user.details}",style: GoogleFonts.poppins(
// //                             fontSize: 10,
// //                             fontWeight: FontWeight.w400
// //                         ),) ,
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 25,
// //                     width: double.infinity,
// //                     //     color: Colors.blue,
// //                     alignment: Alignment.center,
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
// //                         Text("৳ ${user.id}",style: TextStyle(fontSize: 12),),
// //                         SizedBox(width: 10,),
// //                         //    Text("\$ ${user.status}",style: TextStyle(fontSize: 12)),
// //                         IconButton(onPressed: () {
// //
// //                         }, icon: Icon(Icons.favorite,size: 11,)),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       );
// //     },
// //     separatorBuilder: (context, index) {
// //       return Divider();
// //     },
// //     itemCount: (snapshot.data as List<Data>).length);
//
//
//
//
// } else if (snapshot.hasError) {
// return Center( child: Text("${snapshot.error}"));
// }
// return Center(
// child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
// );
// },
// ),