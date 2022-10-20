import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/Screens/Cart_Screen.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/widgets/recent_order.dart';
import 'package:food_app/widgets/star_rating.dart';

import 'Restaruant_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurant() {
    List<Widget> listRestaurant = [];
    restaurants.forEach((Restaurant restaurant) {
      listRestaurant.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaruantScreen(restaurant: restaurant),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      height: 120.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                      image: AssetImage(restaurant.imageUrl),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      StarRating(restaurant.rating),
                      SizedBox(height: 4.0),
                      Text(
                        restaurant.address,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '0.2 miles away',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: listRestaurant,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          iconSize: 30.0,
          onPressed: () {},
          icon: Icon(Icons.account_circle),
        ),
        title: Text('Food Delivery'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            ),
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: 'Search Food or Restraurants',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      //letterSpacing: 1.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              _buildRestaurant(),
            ],
          )
        ],
      ),
    );
  }
}
