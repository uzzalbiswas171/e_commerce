import 'package:dio/dio.dart';
import 'package:ecommerceshope/CustomTextFormField/custom_text_form_field.dart';
import 'package:ecommerceshope/LoginPage/login_screen.dart';
import 'package:ecommerceshope/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

Box ? mybox;

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _phonController=TextEditingController();
  TextEditingController _AddressController=TextEditingController();
  TextEditingController _PasswordController=TextEditingController();


  fachSignup()async{



    try {
      final api = "http://www.bornonbd.com/api/register";
      final dio = Dio();
      final data = {
        "name": _nameController.text.toString(),
        "phone": _phonController.text.toString(),
        "address": _AddressController.text.toString(),
        "password": _PasswordController.text.toString(),
      };
      Response response = await dio.post(api, data: data);

      print(response.data);
      print(response.statusCode);
      if(response.statusCode==201){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Ecommerce_Home_Page(
          name: _nameController.text.toString(),
          photo: "profile_picture,",
          address:_AddressController.text.toString(),
          phone:  _phonController.text.toString(),
        ),));



      }else{
        print("Error statuscode  ${response.statusCode}");
      }
    }catch(e){
      print("catch error ${e}");
    }

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Creat Account",style: TextStyle(fontStyle: FontStyle.italic),),
      ),
      body:  SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("img/walpaperr.jpg"),fit: BoxFit.fill)
          ),
          alignment: Alignment.center,
          child: Padding(
            padding:  EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key:_formKey ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                        },
                        controller: _nameController,
                        Textdata: "Name",
                        hintText: "Enter Name",
                        prefixIcon: IconButton(onPressed: () {

                        }, icon: Icon(Icons.person,color: Colors.white,)),
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                        },
                        controller: _phonController,
                        Textdata: "Phone",
                        hintText: "Enter phone",
                        prefixIcon: IconButton(onPressed: () {

                        }, icon: Icon(Icons.phone,color: Colors.white,)),
                      ),
                      CustomTextFormField(
                        maxLines: 2,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                        },
                        controller: _AddressController,
                        Textdata: "Address",
                        hintText: "Enter Address",
                        prefixIcon: IconButton(onPressed: () {

                        }, icon: Icon(Icons.email)),
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                        },
                        controller: _PasswordController,
                        Textdata: "Password",
                        hintText: "Enter Password",
                        prefixIcon: IconButton(onPressed: () {

                        }, icon: Icon(Icons.visibility_off)),
                      ),
                      // CustomTextFormField(
                      //   validator: (value) {
                      //     if (value.isEmpty) {
                      //       return 'Can\'t be empty';
                      //     }
                      //   },
                      //   controller: _ConformPasswordController,
                      //   Textdata: "Conform Password",
                      //   hintText: "Conform Password",
                      //   prefixIcon: IconButton(onPressed: () {
                      //
                      //   }, icon: Icon(Icons.visibility_off)),
                      // ),
                      InkWell(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                           fachSignup();
                            box.write('name', _nameController.text.toString());
                            box.write('phone', _phonController.text.toString());
                            box.write('address', _AddressController.text.toString());
                            box.write('photo', "photo");

                            print(box.read('name'));
                            print(box.read('phone'));
                            print(box.read('address'));
                            print(box.read('photo'));
                          }



                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20,bottom: 20,),
                          height: 50,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:  Text("Create Account",style: GoogleFonts.poppins(
                            fontSize: 20,fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontStyle: FontStyle.italic,
                          ),),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                        },
                        child: Container(
                          height: 20,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text("Already have an account? ",style: TextStyle(color: Colors.white70),),
                              Text(" Login",style: TextStyle(color: Colors.red[400],fontStyle: FontStyle.italic,fontSize: 15),),
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
  final box = GetStorage();
}
