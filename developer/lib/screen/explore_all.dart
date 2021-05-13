import 'package:flutter/material.dart';

class ExploreAll extends StatefulWidget {
  @override
  _ExploreAllState createState() => _ExploreAllState();
}

class _ExploreAllState extends State<ExploreAll> {
  int _currentPage = 0;
  int totalPages = 3;
  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < totalPages; i++) {
      list.add(buildIndicator(i == _currentPage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey[600],
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildPage(String posta, String post, String title, String subtitle) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(post),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(posta),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32.0,
                  child: Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: CustomSearch(
                  label: "Search for a warehouse",
                  iconData: Icons.settings,
                )),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            height: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        RoundLabel(
                          small: true,
                          color: Colors.red,
                          text: "Latest",
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 220.0,
                    width: double.infinity,
                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        buildPage('images/pos.jpg', 'images/smal.jpg',
                            'Nairobi Warehouse', "300ksh"),
                        buildPage('images/smal.jpg', 'images/pos.jpg',
                            'Nairobi Warehouse', "300ksh"),
                        buildPage('images/sma.jpg', 'images/sma.jpg',
                            'Nairobi Warehouse', "300ksh"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildPageIndicator(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  final String label;
  final IconData iconData;
  CustomSearch({@required this.label, @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                )),
            filled: true,
            fillColor: Colors.grey[800],
            contentPadding: EdgeInsets.only(left: 16.0),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 24.0, left: 16.0),
              child: Icon(
                iconData,
                color: Colors.grey[600],
                size: 27.0,
              ),
            )),
      ),
    );
  }
}

class RoundLabel extends StatelessWidget {
  final bool small;
  final Color color;
  final String text;
  RoundLabel({@required this.small, @required this.color, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: small ? 10 : 16, vertical: small ? 4 : 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            width: 2.0,
            color: color,
          )),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
