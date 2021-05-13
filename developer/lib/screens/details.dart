import 'package:developer/constants/constants.dart';
import 'package:developer/details%20screen/detail_screen.dart';
import 'package:developer/models/mapdetails.dart';
import 'package:developer/models/posts.dart';
import 'package:developer/models/warehouse.dart';
import 'package:developer/screen/stalls.dart';
import 'package:developer/screens/date_time.dart';
import 'package:developer/screens/slider.dart';
import 'package:developer/services/fetchpost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScro extends StatefulWidget {
  static final String id = "Detail";
  final Detail detail;
  DetailScro({
    @required this.detail,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                Image.asset(
                  widget.detail.thumbnails,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 30,
                  top: 60,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: mBackgroundColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: mSecondaryColor,
                          borderRadius: BorderRadius.circular(36)),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 16.0,
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 12,
              bottom: 24,
            ),
            decoration: BoxDecoration(
                color: mSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jumia Warehouse',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Nairobi',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                    ),
                    Text('4.8')
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Book the Warehouse services and get  extra space to store your bulky goods'
                  'Safety is guaranted and all goods are seculrely stored in your warehouse'
                  'Get also deivery services on time with your warehouse goods been delivered'
                  'enjoy the services. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: FlatButton(
              color: mPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Stall.id);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
