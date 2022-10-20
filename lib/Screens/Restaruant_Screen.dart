import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/widgets/star_rating.dart';

class RestaruantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaruantScreen({required this.restaurant});
  @override
  State<RestaruantScreen> createState() => _RestaruantScreenState();
}

class _RestaruantScreenState extends State<RestaruantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 165.0,
            width: 165.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(menuItem.imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 165.0,
            width: 165.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ],
                  stops: [
                    0.1,
                    0.4,
                    0.6,
                    0.9
                  ]),
            ),
          ),
          Positioned(
            bottom: 70.0,
            child: Column(
              children: [
                Text(
                  menuItem.name,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 18.0,
            child: Container(
              width: 48.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.restaurant.imageUrl),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                        size: 35.0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(height: 6.0),
                StarRating(widget.restaurant.rating),
                SizedBox(height: 6.0),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 17.0),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      child: Text('Reviews',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      child: Text('Contact',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Menu',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food food = widget.restaurant.menu[index];
                  return Center(
                    child: _buildMenuItem(food),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
