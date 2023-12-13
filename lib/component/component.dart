
import 'package:flutter/material.dart';
class custumButton extends StatelessWidget {
   custumButton({super.key, required this.text, required this.onPressed, this.color});
   String text;
   VoidCallback? onPressed;
   Color? color ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color = const Color(0xFFEED91D) ,
          minimumSize: const Size(200.0, 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


class customTextField extends StatelessWidget {
   customTextField({super.key, 
     this.onChanged,
     this.validate,
     this.type,
     this.suffix,
     this.isPassword,

   });
   Function(String)? onChanged;
   dynamic validate;
   TextInputType? type;
   IconData? suffix;
   VoidCallback? suffixPressed;
   bool? isPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: validate,
      onChanged: onChanged,
      keyboardType: type,

      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            suffix,
          ), onPressed:suffixPressed,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),
    );
  }
}
