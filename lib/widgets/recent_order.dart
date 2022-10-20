import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/Screens/Home_screen.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);

  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      width: 320.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                    image: AssetImage(order.food.imageUrl),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          order.date,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
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
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                //letterSpacing: 0.8,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          height: 120.0,
          //color: Colors.blue,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: ((context, index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrder(context, order);
              })),
        )
      ],
    );
  }
}
