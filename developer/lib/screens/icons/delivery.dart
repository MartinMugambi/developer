import 'package:flutter/material.dart';

class Delivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 7.0,
                      ),
                      Icon(
                        Icons.arrow_back,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 108.0, left: 190.0),
                  child: Text(
                    'TOTAL Ksh 500.00',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  'Your Order Details ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deliver Now ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              Text(
                'Edit ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Telephone number',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            'Telephone number',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'PickUp Address',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Telephone number',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Telephone number',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Telephone number',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
