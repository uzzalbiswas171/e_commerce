import 'package:ecommerceshope/ProviderDemo/SubCategory/subcategory_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SubCategoryPageDemo extends StatefulWidget {
   SubCategoryPageDemo({Key? key, required this.subCategoryindex}) : super(key: key);
   int subCategoryindex;
  @override
  State<SubCategoryPageDemo> createState() => _SubCategoryPageDemoState();
}

class _SubCategoryPageDemoState extends State<SubCategoryPageDemo> {

  void initState() {
    Provider.of<Sub_Category_Provider>(context, listen: false)
        .getCategories(context,);
    super.initState();
  }
bool isFirst=false;

  @override
  Widget build(BuildContext context) {
    final alldatalist = Provider
        .of<Sub_Category_Provider>(context)
        .allproductlist;
    return Scaffold(
      backgroundColor: Color(0xff00FEBF),
appBar: AppBar(
  leading: IconButton(onPressed: () {
    Navigator.pop(context);
  }, icon: Icon(Icons.arrow_back)),
  title: Text("SubCategory",style: GoogleFonts.poppins(fontSize: 17,letterSpacing: 1,fontWeight: FontWeight.w400),),
),




      body: Container(
        height: double.infinity,
        width: double.infinity,

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
            childCount: alldatalist[widget.subCategoryindex].subCategory!.length,
                (context, index) {

              return InkWell(
                // onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCartDetails(
                //     getindex: index,
                //   ),));
                // },

                onTap: () {

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
                                   image: DecorationImage(image: NetworkImage( "https://bornonbd.com/${alldatalist[widget.subCategoryindex].subCategory![index].image}",),fit: BoxFit.fill),
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
                                    Text("${alldatalist[widget.subCategoryindex].subCategory![index].name}",style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400
                                    ),),
                                    Text(Bidi.stripHtmlIfNeeded("${alldatalist[widget.subCategoryindex].subCategory![index].status}"),style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400
                                    ),) ,
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
                                    Text("৳ ${alldatalist[widget.subCategoryindex].subCategory![index].ipAddress}",style: TextStyle(fontSize: 12),),
                                    SizedBox(width: 10,),
                               //     Text("\$ ${alldatalist[index].currencyAmount}",style: TextStyle(fontSize: 12)),
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
