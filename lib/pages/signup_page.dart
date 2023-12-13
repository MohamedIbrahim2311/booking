// import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylastapp/component/component.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});
  String? emailOrPhoneController;
  String? emirateController;
  String? passwordController;
  String? confirmPasswordController;
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, 'SplachPage');
          },
          icon:const Icon(Icons.close),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 5.0,
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
                      'Create your account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'now',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'EXPLORE NEW THINGS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Or Phone number',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  customTextField(

                    onChanged: (data){
                      emailOrPhoneController =data;
                    },
                    validate: (String? value){
                      if(value != null && value.isEmpty){
                        return 'Email must not be empty ';
                      }},
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const Text(
                    'Emirate',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  customTextField(
                    onChanged: (data){
                      emirateController = data;
                    },
                    validate: (String? value){
                      if(value != null && value.isEmpty){
                        return 'Email must not be empty ';
                      }},
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  customTextField(
                    onChanged: (data){
                      passwordController = data;
                    },
                    // isPassword:password,
                    // suffix: password? Icons.visibility: Icons.visibility_off,
                    // type: TextInputType.visiblePassword,
                    validate: (String? value){
                      if(value != null && value.isEmpty){
                        return 'Password must not be empty ';
                      }},
                 ),
                  const SizedBox(
                    height: 8,
                  ),

                  const Text(
                    'Confirm password',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  customTextField(
                    onChanged: (data){
                      confirmPasswordController = data;
                    },

                    // isPassword:password,
                    // suffix: password? Icons.visibility: Icons.visibility_off,
                    // type: TextInputType.visiblePassword,
                    validate: (String? value){
                      if(value != null && value.isEmpty){
                        return 'Password must not be empty ';
                      }},
                  ),
                  const SizedBox(
                    height: 8,
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
                    text: 'sign up',

                    onPressed: () async{
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailOrPhoneController!,
                            password: passwordController!
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content:Text('weak password'),),);
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content:Text('The account already exists for that email'),),);

                        }
                      } catch (e) {
                        print(e);
                      }
                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(content:Text('success'),),);
                    },

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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'LoginPage');
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'LOGIN',
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
            ],
          ),
        ),
      ),
    );
  }
}
