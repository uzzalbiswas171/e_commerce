
import 'package:ecommerceshope/BootomNavigationBar/bootom_navigation_bar.dart';
import 'package:ecommerceshope/CustomBootomNaviBar/custom_nav_bar.dart';
import 'package:ecommerceshope/Drawer/drawerdemo.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/SQFlite_Database/contact.dart';
import 'package:ecommerceshope/model/SliverAppbar/silivarappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:line_icons/line_icons.dart';

class Ecommerce_Home_Page extends StatefulWidget {
  Ecommerce_Home_Page({Key? key,this.name,this.phone,this.photo,this.address}) : super(key: key);
  String ? name,phone,photo,address;
  @override
  State<Ecommerce_Home_Page> createState() => _Ecommerce_Home_PageState();
}

class _Ecommerce_Home_PageState extends State<Ecommerce_Home_Page> {
  late PageController _pageController;
  List images = [
    "img/p1.jpg",
    "img/p3.jpg",
    "img/p4.jpg",
    "img/p6.jpg",
  ];
  List productlistimg = [
    "img/s1.jpg",
    "img/sh1.jpg",
    "img/s2.jpg",
    "img/sh2.jpg",
    "img/s3.jpg",
    "img/sh3.jpg",
    "img/sh4.jpg",
  ];
  List productlistname = [
    "LAXMN TECH SUEDE",
    "CLASSIC FIT COTTON POLO",
    "APEX CASE SHOO",
    "CLASSIC FIT COTTON POLO",
    "LAXMN TECH SUEDE",
    "CLASSIC FIT COTTON POLO",
    "APEX CASE SHOO",
  ];
  int activePage = 1;
  final PageController _controller = PageController();
  List<Widget> _list = [
    Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage("img/p1.jpg"), fit: BoxFit.fill),
      ),
    ),
    Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/p3.jpg"), fit: BoxFit.fill)),
    ),
    Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/p4.jpg"), fit: BoxFit.fill)),
    ),
  ];
  Contact ? contact;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }
  void _animateSlider() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      int nextPage = _controller.page!.round() + 1;
      if (nextPage == _list.length) {
        nextPage = 0;
      }
      _controller
          .animateToPage(nextPage,
              duration: Duration(seconds: 1), curve: Curves.linear)
          .then((_) => _animateSlider());
    });
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int valueee = 0;
  @override
  Widget build(BuildContext context) {
    PageIndicatorContainer container = PageIndicatorContainer(
      indicatorSelectorColor: Colors.amber,
      child: new PageView(
        children: _list,
        controller: _controller,
      ),
      length: _list.length,
      padding: EdgeInsets.fromLTRB(10, 40, 0, 10),
      indicatorSpace: 10,
      indicatorColor: Colors.greenAccent,
    );

    print("builde hocca full scaffold pagejjjjjjjjjjjjjjjjj");
    final _AddtoCartProvierr = Provider.of<AddtoCartProvider>(context, listen: true);
    final adtocart = Provider.of<AdddTtoCartProvider>(context, listen: true);

    return Scaffold(
      key: _key,
      drawer: DrawerDemoPage(
        name: "${widget.name}",
        phon: "${widget.phone}",
        photo: "${widget.photo}",
        addreess: "${widget.address}",
      ),
      endDrawer: EndDrawerPageDemo( ),
      bottomNavigationBar: CustomNavigationBarPage(Home_color: Colors.pinkAccent, Produc_tColor: Colors.white, Category_color:  Colors.white, setting_Color:  Colors.white),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppsBarPage(
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              Categorybutton: () {
                _key.currentState!.openEndDrawer();
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(color: Colors.grey[100], height: double.infinity),
                    Container(
                      color: Colors.white,
                      child: container,
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 70,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 60,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 6,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    CategoryList[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: isSelected == index
                                      ? Colors.black54
                                      : Colors.white,
                                ),
                                height: 5,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    width: 120,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 100,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:NetworkImage("${_products[index].photo}"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 100,
                            width: 150,
                            margin: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 "${_products[index].name}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 2),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\$200.00",
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.blue[400]),
                                        ),
                                        Container(
                                          alignment: Alignment.topCenter,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isheart = index;
                                                  adtocart.addProduct(_products[index]);
                                                });
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                size: 21,
                                                color: isheart == index
                                                    ? Colors.blue[100]
                                                    : Colors.red[200],
                                              )),
                                        )
                                      ],
                                    )),
                                InkWell(
                                  onTap: () {
                                    _AddtoCartProvierr.setcount();
                                    adtocart.addProduct(_products[index]);
                                    setState(() {
                                      valueee = index;
                                    });
                                  },
                                  child: Container(
                                    height: 26,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xff5B845B),
                                    ),
                                    child: Text("Add to cart",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
            SliverToBoxAdapter(
              child: Container(
                height: 70,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: CategoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isSelectedd = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 60,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 6,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    CategoryList[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: isSelectedd == index
                                      ? Colors.black54
                                      : Colors.white,
                                ),
                                height: 5,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                width: double.infinity,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productlistimg.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 300,
                      width: 200,
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(productlistimg[index]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: 100,
                              width: 150,
                              margin: EdgeInsets.all(3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productlistname[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    height: 26,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xff5B845B),
                                    ),
                                    child: Text(
                                      "Add to cart",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }


  int? isheart;
  int isSelected = 0;
  int isSelectedd = 0;
  List CategoryList = [
    "Top Seller",
    "Details",
    "Most liked",
    "Top Seller",
    "Details",
    "Most Liked",
  ];
// Initializing a Controller fore PageView
}

///////////////////////////////////////////////////
List<Product> _products = [
  Product(
      id: 1,
      name: "Apple",
      price: 20.0,
      photo: "https://img.icons8.com/plasticine/2x/apple.png",
      qty: 1),
  Product(
      id: 2,
      name: "Banana",
      price: 40.0,
      photo: "https://img.icons8.com/cotton/2x/banana.png",
      qty: 1),
  Product(
      id: 3,
      name: "Orange",
      price: 20.0,
      photo: "https://img.icons8.com/cotton/2x/orange.png",
      qty: 1),
  Product(
      id: 4,
      name: "Melon",
      price: 40.0,
      photo: "https://img.icons8.com/cotton/2x/watermelon.png",
      qty: 1),
  Product(
      id: 5,
      name: "Avocado",
      price: 25.0,
      photo: "https://img.icons8.com/cotton/2x/avocado.png",
      qty: 1),
];
///////////////////////////////////////////////////















class SliderBox extends StatelessWidget {
  final Widget? child;

  const SliderBox({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10), child: child);
  }
}
