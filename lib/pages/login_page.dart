import 'package:flutter/material.dart';
import 'package:mylastapp/component/component.dart';
import 'package:mylastapp/layout/home_layout.dart';

class Login extends StatelessWidget {
   const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.close),

        ),
      ),
     body: Padding(

       padding: const EdgeInsets.only(
         top: 50.0,
         bottom: 8.0,
         left: 8.0,
         right: 8.0,
       ),
       child: SingleChildScrollView(
         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Center(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     'Welcome back',
                     style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Center(
                     child: Text(
                       'Lorem ipsum dolor sit amet consectetur. Odio',
                       style: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                       ),
                     ),

                   ),
                   Text(
                     ' pellentesque orci',
                     style: TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                 ],
               ),
             ),
             const Text(
               'Email',
               style: TextStyle(
                 fontSize: 15,
                 fontWeight: FontWeight.w600,
               ),
             ),
             const SizedBox(
               height: 5,
             ),
             TextFormField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
               keyboardType: TextInputType.emailAddress,
             ),
             const SizedBox(
               height: 10,
             ),

             const Text(
               'Password',
               style: TextStyle(
                 fontSize: 15,
                 fontWeight: FontWeight.w600,
               ),
             ),
             const SizedBox(
               height: 5,
             ),
             TextFormField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
               keyboardType: TextInputType.emailAddress,
             ),
             // SizedBox(
             //   height: 3,
             // ),

             TextButton(
               onPressed: () {
                 // Handle text button press
               },
               child: const Text(
                 'Forgot your password?',
                   style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.w600,
                   ),
               ),
             ),

             Row(
               children: [
                 Expanded(
                   child: Container(
                     margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                     child: const Divider(
                       color: Colors.grey,
                       height: 36,
                     ),
                   ),
                 ),
                 const Text(
                   "Or continue with",
                   style: TextStyle(
                     fontSize: 13,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
                 Expanded(
                   child: Container(
                     margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                     child: const Divider(
                       color: Colors.grey,
                       height: 36,
                     ),
                   ),
                 ),
               ],
             ),
             const SizedBox(
               height: 10,
             ),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width: 46,
                   height: 49,
                   padding: const EdgeInsets.all(5.0),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.white, // Set the background color
                     border: Border.all(
                       color: Colors.black, // Set the border color
                       width: 1.0, // Set the border width
                     ),
                   ),
                   child: GestureDetector(
                     onTap: (){

                     },
                     child: Image.asset(
                       "lib/images/logos_facebook.png",
                       width: 42,
                       height: 41,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 const SizedBox(
                   width: 20.0,
                 ),
                 Container(
                   width: 46,
                   height: 49,
                   padding: const EdgeInsets.all(5.0),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.white, // Set the background color
                     border: Border.all(
                       color: Colors.black, // Set the border color
                       width: 1.0, // Set the border width
                     ),
                   ),
                   child: GestureDetector(
                     onTap: (){

                     },
                     child: Image.asset(
                       "lib/images/google.png",
                       width: 31,
                       height: 32,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 const SizedBox(
                   width: 20.0,
                 ),
                 Container(
                   width: 46,
                   height: 49,
                   padding: const EdgeInsets.all(5.0),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.white, // Set the background color
                     border: Border.all(
                       color: Colors.black, // Set the border color
                       width: 1.0, // Set the border width
                     ),
                   ),
                   child: GestureDetector(
                     onTap: (){

                     },
                     child: Image.asset(
                       "lib/images/apple.png",
                       width: 35,
                       height: 35,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
               ],
             ),
             const SizedBox(
               height: 10,
             ),

             custumButton(
                 text: 'log in',
                 onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context)=>const Homelayout(),
                       ),
                   );
                 }
             ),
             const SizedBox(
               height: 10,
             ),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 TextButton(
                   onPressed: () {
                     // Handle text button press
                   },
                   child: const Text(
                     'By continuing you accept our Terms and \n conditions, and our Privacy and policy.',
                     style: TextStyle(
                       decoration: TextDecoration.underline,
                       fontSize: 15,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
               ],
             ),
             const SizedBox(
               height: 25,
             ),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text(
                   'You didn’t have an account?',
                   style: TextStyle(
                     color: Colors.grey,
                     fontSize: 12,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 TextButton(
                   onPressed: () {
                     Navigator.pushNamed(context, 'SignPage');
                   },
                   child: RichText(
                     text: const TextSpan(
                       text: 'SIGN UP',
                       style: TextStyle(
                         color: Color(0xFFEED91D),
                         decoration: TextDecoration.underline,
                         decorationColor: Color(0xFFEED91D),
                         decorationThickness: 2,
                         fontSize: 12,
                         fontWeight: FontWeight.w700,
                       ),
                     ),
                   ),
                 )
               ],
             ),
           ],
         ),
       ),
     ),
    );
  }
}
