import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:developer/constants/constants.dart';
import 'package:developer/models/posts.dart';
import 'package:developer/screens/sigu.dart';
import 'package:developer/screens/slider.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final Function press;

  const PostWidget({
    Key key,
    this.post,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      child: GestureDetector(
        onTap: press,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          elevation: 4.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Image.asset("images/spinner.gif"),
                    imageUrl: post.image,
                    height: 150,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              post.title,
                              style: postTextStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FittedBox(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    post.subtitle,
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            "\ksh ${post.price}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
