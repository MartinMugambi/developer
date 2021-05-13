import 'dart:io';
import 'package:developer/animations/fade_animations.dart';
import 'package:developer/screens/sigu.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);
  static final String id = "onboarding_screen";
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 375),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            _currentPage = page;
            setState(() {});
          },
          children: <Widget>[
            _buildPageContent(
              image: 'images/home.png',
              title: 'Order From your Comfort',
              body: 'No need of much hussle order at your confort',
            ),
            _buildPageContent(
              image: 'images/onboa.png',
              title: 'Select the Date',
              body: 'Select the day, View Location. Get the Best Services',
            ),
            _buildPageContent(
              image: 'images/extra.png',
              title: 'Get extra Storage Space',
              body: 'Enjoy extra storage space for your businesss products',
            ),
          ],
        ),
      ),
      bottomSheet: _currentPage != 2
          ? Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        2,
                        duration: Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.linear,
                      );
                      setState(() {});
                    },
                    splashColor: Colors.blue,
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                        fontFamily: 'Exo-VariableFont_wght',
                      ),
                    ),
                  ),
                  Container(
                    child: Row(children: [
                      for (int i = 0; i < _totalPages; i++)
                        i == _currentPage
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false)
                    ]),
                  ),
                  FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.linear,
                      );
                      setState(() {});
                    },
                    splashColor: Colors.cyan,
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                        fontFamily: 'Exo-VariableFont_wght',
                      ),
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Sigu.id);
              },
              child: FadeAnimation(
                2.2,
                Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: Color(0xffff9748f),
                  alignment: Alignment.center,
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                      fontFamily: 'ProductSans-Bold',
                    ),
                  ),
                ),
              )),
    );
  }

  Widget _buildPageContent({String image, String title, String body}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: FadeAnimation(
            1.4,
            Image.asset(image),
          )),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: FadeAnimation(
                1.8,
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                    // fontFamily: 'Exo-VariableFont_wght',
                    // fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          SizedBox(
            height: 8.0,
          ),
          FadeAnimation(
              2.0,
              Center(
                child: Text(
                  body,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Exo-VariableFont_wght',
                    height: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
