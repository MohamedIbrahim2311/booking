
import 'package:flutter/material.dart';
import 'package:mylastapp/profile.dart';

import 'booking.dart';
import 'layout/home_layout.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({super.key});


  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex=2;
    List<Widget> screens = [
      const Homelayout(),
      const BookingScreen(),
      const InvestScreen(),
      const ProfileScreen(),
    ];
    return  Scaffold(

      appBar: AppBar(
        title: const Text('mohamed'),
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
