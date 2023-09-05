import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({Key? key,this.maxLines,this.prefixIcon,this.Textdata,this.hintText,required this.controller,required this.validator}) : super(key: key);
  final Widget? prefixIcon;
   final String? Textdata,hintText;
   final TextEditingController controller;
   final FormFieldValidator ? validator;
   final int ? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${Textdata}",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black54,
          ),
          alignment: Alignment.center,
          child: TextFormField(
            validator: validator,
            controller:controller ,
            maxLines:maxLines ,
            style: TextStyle(fontSize: 16, color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white,),
            ),
          ),
        ),

      ],
    );
  }
}
