
  import 'package:flutter/material.dart';

  import 'bookingScreens/active_Screen.dart';
import 'bookingScreens/pastScreen.dart';
  import 'bookingScreens/upcomingScreen.dart';
import 'layout/home_layout.dart';
  import 'invest.dart';
  import 'profile.dart';


  class BookingScreen extends StatefulWidget {
    const BookingScreen({Key? key}) : super(key: key);

    @override
    State<BookingScreen> createState() => _BookingScreenState();
  }

  class _BookingScreenState extends State<BookingScreen> {
    int currentIndex = 1;

    List<Widget> screens = [
      const Homelayout(),
      const BookingScreen(),
      const InvestScreen(),
      const ProfileScreen(),
    ];

    List<String> buttonLabels = ["Past", "Active", "Upcoming"];
    int selectedTabIndex = 1; // Set the initial selection to "Active"

    @override
    void initState() {
      super.initState();
      currentIndex = selectedTabIndex; // Set currentIndex to the default view
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 150,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < buttonLabels.length; index++)
                _buildTabButton(index),
            ],
          ),
        ),
        body: IndexedStack(
          index: selectedTabIndex,
          children: const [
            ActiveScreen(title: 'Ovio restaurant',
                  description:  'You booked a table on this restaurant for Today',
                  rating: '',
                thumbnailUrl: 'images/img_5.png',
                date: '23,nov,2023',
                price: 100),
            PastScreen(title: 'Gosto restaurant', description: 'You booked a table on this restaurant 45 Days ago', rating: '', thumbnailUrl: 'images/img_5.png', date: '23 nov 2023', price: 100),
            UPcomingScreen(title: 'Radisson Hotel', description: 'You booked a table on this restaurant 45 Days ago', rating: '', thumbnailUrl: 'images/img_5.png', date: '', price: 100)
            
            // Add other screens as needed
          ],
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

    Widget _buildTabButton(int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedTabIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                buttonLabels[index],
                style: TextStyle(
                  color: selectedTabIndex == index ? Colors.black : Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (selectedTabIndex == index)
                Container(
                  height: 3,
                  width: 40,
                  color: Colors.black,
                ),
            ],
          ),
        ),
      );
    }
  }