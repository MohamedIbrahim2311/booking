
import 'package:flutter/material.dart';

import 'booking.dart';
import 'invest.dart';
import 'layout/home_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex=3;
    List<Widget> screens = [
      const Homelayout(),
      const BookingScreen(),
      const InvestScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar  (
        elevation: 0,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Ink(
            decoration: const ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(color: Color(0xffeed91d), width: 0.0),
              ),
              color: Color(0xffeed91d),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homelayout(),
                  ),
                );


              },
            ),
          ),
        ),


      ),
      body: const Center(

      ),






      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: BottomNavigationBar(
          iconSize: 35,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });

            // Use Navigator to push the corresponding screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => screens[index]),
            );
          },
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          backgroundColor: const Color(0xffe8dd7d),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xff8f8c6e),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_outlined),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.paid_outlined),
              label: 'Invest',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );

  }




}
