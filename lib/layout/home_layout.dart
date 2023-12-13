
import 'package:flutter/material.dart';
import 'package:mylastapp/booking.dart';
import '../invest.dart';
import '../profile.dart';
import 'Restaurant_pages/restaurant.dart';
import 'cafas.dart';
import 'hotels.dart';


class Homelayout extends StatefulWidget {
  const Homelayout({Key? key}) : super(key: key);

  @override
  _HomelayoutState createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {
  int currentIndex = 0;

  List<Widget> screens = [
    const Homelayout(),
    const BookingScreen(),
    const InvestScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 150,
        title: Row(
          children: [
            const SizedBox(height: 2),
            const CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('images/img.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: screenWidth - 200,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_alert_sharp,
              size: 30,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: _buildUserInfo(),
          ),
          Expanded(
            flex: 4,
            child: _buildGridView(),
          ),


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

  Widget _buildUserInfo() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Text(
            'Welcome, Soha',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Auctor erat sodales purus risus lorem',
            style: TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    List<Category> categories = [
      const Category(name: 'Rustrunt', image: 'images/img_1.png', navigator: Restaurant()),
      const Category(name: 'Hotels', image: 'images/img_3.png', navigator: HotelsScreen()),
      const Category(name: 'Work space', image: 'images/img_4.png', navigator: HotelsScreen()),
      const Category(name: 'Cafe', image: 'images/img_2.png', navigator: CafasScreen()),
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return categories[index];
      },
    );
  }
}

class Category extends StatelessWidget {
  final String name;
  final String image;
  final Widget navigator;

  const Category({super.key, required this.name, required this.image, required this.navigator});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigator,
          ),
        );
        },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.black),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                image,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

