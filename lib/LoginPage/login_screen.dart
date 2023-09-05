
import 'package:dio/dio.dart';

import 'package:ecommerceshope/CustomBootomNaviBar/custom_nav_bar.dart';
import 'package:ecommerceshope/LoginPage/signup.dart';
import 'package:ecommerceshope/ProviderDemo/LogoutProvider/logoutprovider.dart';
import 'package:ecommerceshope/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final box = GetStorage();
             TextEditingController phoneController=TextEditingController();
             TextEditingController passwordController=TextEditingController();

  String? token;
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  String? name, phone, address,profile_picture;

  //
  // Future<bool> check() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     return true;
  //   }
  //   return false;
  // }

  Future isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    print("ssssssssssssssssssssssssssssssssssssssssss ${token}");
    print("ssssssssssssssssssssssssssssssssssssssssss ${name}");
    print("ssssssssssssssssssssssssssssssssssssssssss ${phone}");
    print("ssssssssssssssssssssssssssssssssssssssssss ${profile_picture}");

    if (box.read('token') != null) {
      print("Not null");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Ecommerce_Home_Page(
      name: name,
      photo: profile_picture,
      address: address,
      phone: phone,

    ),));
    } else {
      print("Token is null");
    }
  }
             login() async {
               try {
                 sharedPreferences = await SharedPreferences.getInstance();
                 setState(() {
                   isLoading = true;
                 });
                 final api = 'https://bornonbd.com/api/login';
                 final data = {
                   "phone": phoneController.text.toString(),
                   "password": passwordController.text.toString()
                 };
                 final dio = Dio();
                 Response response;
                 response = await dio.post(api, data: data);
                 if (response.data["customer"] != null) {
                   Navigator.push(
                       context, MaterialPageRoute(builder: (context) {
                     return Ecommerce_Home_Page(
                       name: "${response.data["customer"]["name"]}",
                       phone: "${response.data["customer"]["phone"]}",
                       address: "${response.data["customer"]["address"]}",
                       photo: "${response.data["customer"]["profile_picture"]}",
                     );
                   }));


                   name="${response.data["customer"]["name"]}";
                   phone="${response.data["customer"]["phone"]}";
                   address="${response.data["customer"]["address"]}";
                   profile_picture="${response.data["customer"]["profile_picture"]}";

                   print(" access token ${response.data["access_token"]}");
                   print(" access name ${response.data["customer"]["name"]}");
                   print(" access phone ${response.data["customer"]["phone"]}");
                   print(" access address ${response.data["customer"]["address"]}");
                   print(" access profile_picture ${response.data["customer"]["profile_picture"]}");
                   print("ddddddddddd${response.data}");


                   setState(() {
                     isLoading = false;
                     sharedPreferences.setString("token","eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYm9ybm9uYmQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjcyMDMxNzQ5LCJleHAiOjE2NzIwMzUzNDksIm5iZiI6MTY3MjAzMTc0OSwianRpIjoiektOekFVWHZhTnNqQUhnRCIsInN1YiI6MzEsInBydiI6IjFkMGEwMjBhY2Y1YzRiNmM0OTc5ODlkZjFhYmYwZmJkNGU4YzhkNjMifQ.yuC0N9MU1fEFQcHt5URT1OvHqqe1EmLwrAA5ztlX8TQ");
                  //   sharedPreferences.setString("token","${response.data["access_token"]}");
                     sharedPreferences.setString("name","${response.data["customer"]["name"]}");
                     sharedPreferences.setString("phone","${response.data["customer"]["phone"]}");
                     sharedPreferences.setString("address","${response.data["customer"]["address"]}");
                     sharedPreferences.setString("profile_picture","${response.data["customer"]["profile_picture"]}");
                   });
                   print("save token");
                   token = sharedPreferences.getString("token");
                   name = sharedPreferences.getString("name");
                   phone = sharedPreferences.getString("phone");
                   address = sharedPreferences.getString("address");
                   profile_picture = sharedPreferences.getString("profile_picture");
                   print(token);
                   print(name);
                   print(phone);
                   print(address);
                   print(profile_picture);

                   box.write('token', token);
                   box.write('name', name);
                   box.write('phone', phone);
                   box.write('address',address);
                   box.write('photo', profile_picture);

                   print(box.read('token'));
                   print(box.read('name'));
                   print(box.read('phone'));
                   print(box.read('address'));
                   print(box.read('photo'));



                 }
                 else {
                   print("jhsdvfjshdsdsdsdsdsdsdssddssds");
                 }
                 return "Something Wrong";
               } catch (e) {
                 return e.toString();
               }
             }

  @override
  void initState() {
   isLogin();
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginprovider=Provider.of<LogoutProvider>(context);
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssss");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomNavigationBarPage(Home_color: Colors.white, Produc_tColor: Colors.white, Category_color:  Colors.white, setting_Color:  Colors.pinkAccent),
        body: Column(
          children: [

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // image: DecorationImage(
                  //     image: AssetImage('LiginImag/borongbd.PNG'),
                  //     ),
              ),
              padding: EdgeInsets.only(top: 20),
              child: Image.asset('LiginImag/borongbd.PNG'),

              alignment: Alignment.topCenter,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54,
                            ),
                            child: TextFormField(
                              controller: phoneController,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                hintText: 'Phone',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54,
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          GestureDetector(
                            onTap: () {
                            login( );


                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightGreen[200],
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    ' Log In',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      letterSpacing: 1,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Row(
                              children: [
                                Text(
                                  'Create a new account ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpPage(),
                                        ));
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Colors.pinkAccent[200],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' or ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Forget Password',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: Container(
                          //         width: 60,
                          //         height: 60,
                          //         padding: const EdgeInsets.all(5),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(15),
                          //           color: Colors.white38,
                          //         ),
                          //         child: Image.asset('LiginImag/google.png'),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 50),
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: Container(
                          //         width: 60,
                          //         height: 60,
                          //         padding: const EdgeInsets.all(5),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(15),
                          //           color: Colors.white38,
                          //         ),
                          //         child: Image.asset('LiginImag/facebook.png'),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





//
// import 'dart:convert';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
//
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late String email, password;
//   bool isLoading=false;
//   TextEditingController _emailController=new TextEditingController();
//   TextEditingController _passwordController=new TextEditingController();
//   GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
//   late ScaffoldMessengerState scaffoldMessenger ;
//   @override
//   Widget build(BuildContext context) {
//     scaffoldMessenger = ScaffoldMessenger.of(context);
//     return Scaffold(
//       backgroundColor: Colors.red,
//         key: _scaffoldKey,
//         body: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                   child: Image.asset(
//                     "assets/background.jpg",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Center(
//                           child: Image.asset(
//                             "assets/logo.png",
//                             height: 30,
//                             width: 30,
//                             alignment: Alignment.center,
//                           ),
//                       ),
//                       SizedBox(
//                         height: 13,
//                       ),
//                       Text(
//                         "Learn With Us",
//                         style: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                                 fontSize: 27,
//                                 color: Colors.white,
//                                 letterSpacing: 1)),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Container(
//                         width: 180,
//                         child: Text(
//                           "RRTutors, Hyderabad",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                                 color: Colors.white54,
//                                 letterSpacing: 0.6,
//                                 fontSize: 11),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Text(
//                         "Sign In",
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: 1,
//                             fontSize: 23,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "Learn new Technologies ????",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.roboto(
//                               textStyle: TextStyle(
//                                 color: Colors.white70,
//                                 letterSpacing: 1,
//                                 fontSize: 17,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Form(
//                         key: _formKey,
//                         child: Container(
//                           margin:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 45),
//                           child: Column(
//                             children: <Widget>[
//                               TextFormField(
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 controller: _emailController,
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.white)),
//                                   hintText: "Email",
//                                   hintStyle: TextStyle(
//                                       color: Colors.white70, fontSize: 15),
//                                 ),
//                                 onSaved: (val) {
//                                   email = val!;
//                                 },
//                               ),
//                               SizedBox(
//                                 height: 16,
//                               ),
//                               TextFormField(
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 controller: _passwordController,
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.white)),
//                                   hintText: "Password",
//                                   hintStyle: TextStyle(
//                                       color: Colors.white70, fontSize: 15),
//                                 ),
//                                 onSaved: (val) {
//                                   email = val!;
//                                 },
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               Stack(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       if(isLoading)
//                                       {
//                                         return;
//                                       }
//                                       if(_emailController.text.isEmpty||_passwordController.text.isEmpty)
//                                       {
//                                         scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Fill all fileds")));
//                                         return;
//                                       }
//                                       login(_emailController.text,_passwordController.text);
//                                       setState(() {
//                                         isLoading=true;
//                                       });
//                                       //Navigator.pushReplacementNamed(context, "/home");
//                                     },
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       width: double.infinity,
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 10, horizontal: 0),
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.white),
//                                         borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       child: Text(
//                                         "SUBMIT",
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.roboto(
//                                             textStyle: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 16,
//                                                 letterSpacing: 1)),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(child: (isLoading)?Center(child: Container(height:26,width: 26,child: CircularProgressIndicator(backgroundColor: Colors.green,))):Container(),right: 30,bottom: 0,top: 0,)
//
//                                 ],
//                               )
//
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "OR",
//                         style: TextStyle(fontSize: 14, color: Colors.white60),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Image.asset(
//                         "assets/fingerprint.png",
//                         height: 36,
//                         width: 36,
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacementNamed(context, "/signup");
//                         },
//                         child: Text(
//                           "Don't have an account?",
//                           style: GoogleFonts.roboto(
//                               textStyle: TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 13,
//                                   decoration: TextDecoration.underline,
//                                   letterSpacing: 0.5)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
//
//   login(email,password) async
//   {
//
//
//
//     Map data = {
//       'email': email,
//       'password': password
//     };
//     print(data.toString());
//     final  response= await http.post(
//         Uri.parse("https://bornonbd.com/api/login"),
//         headers: {
//           "Accept": "application/json",
//           "Content-Type": "application/x-www-form-urlencoded"
//         }, body: data,
//         encoding: Encoding.getByName("utf-8")
//     )  ;
//     setState(() {
//       isLoading=false;
//     });
//     if (response.statusCode == 200) {
//
//       print(response.body);
//
//       Map<String,dynamic>resposne=jsonDecode(response.body);
//       if(!resposne['error'])
//       {
//         Map<String,dynamic>user=resposne['data'];
//         print(" User name ${user['id']}");
//         savePref(1,user['name'],user['phone'],user['id']);
//         showDialog(context: context, builder: (context) {
//           return AlertDialog(
//             title: Text("hgfhgfhgfhg"),
//           );
//         },);
//       }else{
//         print(" ${resposne['message']}");
//       }
//       scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne['message']}")));
//
//     } else {
//       scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please try again!")));
//     }
//
//
//   }
//   savePref(int value, String name, String phone, int id) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//
//     preferences.setInt("value", value);
//     preferences.setString("name", name);
//     preferences.setString("phone", phone);
//     preferences.setString("id", id.toString());
//     preferences.commit();
//
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
















