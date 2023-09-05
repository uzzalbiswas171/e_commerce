

import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/CategoryProvider/category_provider.dart';
import 'package:ecommerceshope/ProviderDemo/LogoutProvider/logoutprovider.dart';
import 'package:ecommerceshope/ProviderDemo/NewArivelProvider/new_arrivel_provider.dart';
import 'package:ecommerceshope/ProviderDemo/SubCategory/subcategory_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';


// void main(){
//   runApp(const MyApp());
// }

main() async {
  await GetStorage.init();
  runApp(MyApp());
}


// Future<void> main() async {
//   await Hive.initFlutter();
//   var box=await Hive.openBox("Mylist");
//   runApp(const MyApp());
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddtoCartProvider>( create: (context) => AddtoCartProvider()),
        ChangeNotifierProvider<AllProductProvider>(create: (context) => AllProductProvider(),),
        ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider(),),
        ChangeNotifierProvider<NewArrivelProvider>(create: (context) => NewArrivelProvider(),),
        ChangeNotifierProvider<Sub_Category_Provider>(create: (context) => Sub_Category_Provider(),),
        ChangeNotifierProvider<LogoutProvider>(create: (context) => LogoutProvider(),),
        ChangeNotifierProvider<AdddTtoCartProvider>(create: (context) => AdddTtoCartProvider(),),
        ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Ecommerce Shop',
         theme: ThemeData(
           primarySwatch: Colors.blue,
         ),
         //   home: const SPlash_Screen_Page(),
         //    home: Ecommerce_Home_Page(),
         //   home:  My_Order_Page(),
        //  home:  RecitReportPage(),
        //  home: MyStatefulWidget(),
       home: Ecommerce_Home_Page(),
         //   home: HomePage(),






         // All_Product_Page(),
         // CategoryPageAPI(),
         // LoginScreen(),






       ),
    );

    // return ChangeNotifierProvider(create: (context) => AddtoCartProvider(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Ecommerce Shop',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     //   home: const SPlash_Screen_Page(),
    //    home: Ecommerce_Home_Page(),
    //    //  home:  My_Order_Page(),
    //    //  home:  RecitReportPage(),
    //     //   home:  ExamplePage(),
    //   ),
    // );
  }
}

//

//
//
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:ecommerceshope/API_All_ModelClass/all_category_model_class.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// Future<Data> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://bornonbd.com/api/category'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print(response.body);
//     return Data.fromJson(jsonDecode(response.body));
//
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
//
//
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late Future<Data> futureAlbum;
//
//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Data>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text("${snapshot.data!.status}");
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }