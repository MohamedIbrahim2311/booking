
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mylastapp/component/component.dart';
import 'package:mylastapp/layout/home_layout.dart';
import 'dart:async';

import 'restaurant_book.dart';
import 'restuarant_Action.dart';
class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);



  late Position _currentPosition;
  List<Map<String, dynamic>> restaurantData = [];
  // Replace with your actual API data

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _fetchDataFromApi(); // Fetch data from API on initialization
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> _fetchDataFromApi() async {
    // Replace with your actual API data fetching logic
    // This is just a placeholder
    restaurantData = [
      {
        'thumbnailUrl': 'images/img_1.png',
        'title': 'Ovio restaurant ',
        'description': 'Description 1',
        'date': '2023-12-01',
        'location': '123 Main St, City 1',
        'price': 25.99,
        'rating': 4.5,
        'onAction': 'on Action',
      },
      {
        'thumbnailUrl': 'images/img_1.png',
        'title': 'Ovio restaurant ',
        'description': 'Description 1',
        'date': '2023-12-01',
        'location': '123 Main St, City 1',
        'price': 25.99,
        'rating': 4.5,
      },
      {
        'thumbnailUrl': 'images/img_1.png',
        'title': 'Ovio restaurant ',
        'description': 'Description 1',
        'date': '2023-12-01',
        'location': '123 Main St, City 1',
        'price': 25.99,
        'rating': 4.5,
        'onAction': 'on Action',
      },
      // Add more data as needed
    ];

    // Sort the restaurantData based on the rating in descending order
    restaurantData.sort((a, b) => b['rating'].compareTo(a['rating']));

    setState(() {}); // Trigger a rebuild after fetching data
  }
  Widget _buildBookRe(Map<String, dynamic> restaurant) {
    return BookRe(
      thumbnailUrl: restaurant['thumbnailUrl'],
      title: restaurant['title'],
      location: restaurant['location'],
      price: restaurant['price'],
      rating: restaurant['rating'],
    );
  }

  Widget _buildJoneAction(Map<String, dynamic> restaurant) {
    return JoneAction(
      thumbnailUrl: restaurant['thumbnailUrl'],
      title: restaurant['title'],
      location: restaurant['location'],
      onAction: restaurant['onAction'],
      rating: restaurant['rating'],
    );
  }
  void openSearch(BuildContext context) {
    showSearch(context: context, delegate: CustomSearchDelegate(restaurantData));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Restaurants",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.height,

          child: Column(
            children: [
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. "
                        "Enim enim egestas donec arcu aliquet elementum.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 320,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Search by name",
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (query) {
                                    // Handle search logic
                                  },
                                  onTap: () {
                                    openSearch(context);
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: Color(0xff0e0e0d), width: 0.0),
                        ),
                        color: Color(0xff0e0e0d),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search_rounded),
                        iconSize: 30,
                        color: Colors.white,
                        onPressed: () {
                          showSearch(
                              context: context, delegate: CustomSearchDelegate(
                              restaurantData));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "All Filters",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _ModelBottomSheet(context);
                    },
                    icon: const Icon(
                      Icons.menu_open,
                      size: 30,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
              // Use ListView.builder to repeat _buildSection for each restaurant
              Expanded(
                flex: 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurantData.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurantData[index];

                    // Check if the 'onAction' parameter is present in the restaurant data
                    if (restaurant.containsKey('onAction')) {
                      return _buildJoneAction(restaurant);
                    } else {
                      return _buildBookRe(restaurant);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }














  void _ModelBottomSheet(context) {
    final Completer<GoogleMapController> controller0 = Completer<GoogleMapController>();
    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        TextEditingController locationController = TextEditingController();

        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 100,
            width: MediaQuery.of(context).size.width * 100,
            child: Column(
              children: [
                const SizedBox(
                  width: 100,
                  height: 20,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                const Center(
                  child: Text(
                    "Filters",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Sort By", style: TextStyle(fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "All",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Auctions",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Bookings",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Price: low to high",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Price: high to low",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Most popular",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Most reviewed",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      labelText: 'Search Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "or choose on map",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                   children: [
                     Expanded(
                       child: SizedBox(
                         width: 400,
                         height: 400,
                         child:  GoogleMap(
                           mapType: MapType.hybrid,
                           initialCameraPosition: kGooglePlex,
                           onMapCreated: (GoogleMapController controller) {
                             controller0.complete(controller);
                           },
                         ),
                       ),
                     ),
                   ],
                 ),
                Row(
                  children: [
                    Text(
                      "Apply",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 16), // مساحة فارغة بين النص والزر
                    // ElevatedButton(
                    //   onPressed: () {
                    //       },
                    //
                    //   child: Text("Apply"),
                    // ),
                    custumButton(
                      color: Colors.black,
                        text: 'Apply',
                        onPressed: (){

                        },
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );


    Future<void> goToTheLake() async {
      final GoogleMapController controller = await controller0.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));
    }
  }

}


class BookRe extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String location;
  final double rating;
  final double price;

  const BookRe({super.key, 
    required this.thumbnailUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (price > 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RestaurantBooking(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RestaurantAction(),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 144,
              height: 127.17,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // Handle rating update if needed
                    },
                    itemSize: 20,
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(width: 10),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Very Good. (500 Reviews)",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Close to you',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        price.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 195,
                    height: 19,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class JoneAction extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String location;
  final double rating;
  final String onAction;

  const JoneAction({super.key, 
    required this.thumbnailUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onAction.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RestaurantAction(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RestaurantBooking(),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 144,
              height: 127.17,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // Handle rating update if needed
                    },
                    itemSize: 20,
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(width: 10),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Very Good. (500 Reviews)",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Close to you',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        onAction,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 195,
                    height: 19,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> searchData;

  CustomSearchDelegate(this.searchData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> suggestions = searchData
        .where((data) => data['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]['title']),
          onTap: () {
            navigateToDynamicScreen(context, suggestions[index]['title']);
          },
        );
      },
    );
  }

  void navigateToDynamicScreen(BuildContext context, String suggestion) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DynamicScreen(screenName: suggestion),
      ),
    );
  }
}

class DynamicScreen extends StatelessWidget {
  final String screenName;

  const DynamicScreen({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
          appBar: AppBar(
             title: Text(screenName),
        ),
        body: Center(
          child: Text('Dynamic Screen: $screenName'),
        ),
        );
        }


}