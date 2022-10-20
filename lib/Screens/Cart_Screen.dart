import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/Screens/Home_screen.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          order.food.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          order.restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(width: 0.8, color: Colors.black54),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Text(
                                order.quantity.toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 20.0),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              '\$${order.quantity * order.food.price}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})',
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildCartItem(order);
            }
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Estimated Delivery Time:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 24.0),
                    ),
                  ],
                )
              ],
            );
          },
          separatorBuilder: ((context, index) {
            return Divider(
              color: Colors.grey,
              height: 1.0,
            );
          }),
          itemCount: currentUser.cart.length + 1),
    );
  }
}
