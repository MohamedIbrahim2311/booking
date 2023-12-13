import 'package:flutter/material.dart';
import 'package:mylastapp/component/component.dart';

class splash extends StatelessWidget {
   const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 450.0,
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                  "WELCOME TO SPRINGY",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  )
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                'Lorem ipsum dolor sit amet consectetur. Nullam',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                  'volutpat',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                  'at consectetur varius. Odio scelerisque nisi',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                  'volutpat',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                  'phasellus odio sit.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
              ),
              const SizedBox(
                height: 10,
              ),

              custumButton(
                  text: 'sign up',
                  onPressed:(){
                    
                  }
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
        ),
      ),
    );
  }
}
