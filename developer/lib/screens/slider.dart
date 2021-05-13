import 'package:cached_network_image/cached_network_image.dart';
import 'package:developer/models/posts.dart';
import 'package:developer/screens/mapview.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slidera extends StatelessWidget {
  final Post post;
  Slidera({Key key, this.post}) : super(key: key);
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingWidget(
        leadingIcon: Icons.explore,
        txt: "Map view",
      ),
      body: Container(
        child: Stack(
          children: [
            PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  post.images.length,
                  (int index) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black12.withOpacity(0.3),
                              BlendMode.darken),
                          image: CachedNetworkImageProvider(
                            post.images[index],
                          )),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 346.8,
                margin: EdgeInsets.only(left: 28.8, bottom: 48.0, right: 28.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: post.images.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFFFFFF),
                        dotColor: Color(0xFFababab),
                        dotHeight: 7.0,
                        dotWidth: 12.0,
                        spacing: 4.8,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        post.title,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        post.subtitle,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start From',
                              style: TextStyle(
                                fontSize: 20.8,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\ksh ${post.price.toString()}',
                              style: TextStyle(
                                fontSize: 25.8,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String txt;
  FloatingWidget({
    Key key,
    this.leadingIcon,
    this.txt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 150,
      child: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          Navigator.pushReplacementNamed(context, MapView.id);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75.0),
        ),
        heroTag: null,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300.0,
              minHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
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
