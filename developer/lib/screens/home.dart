import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:developer/appstate.dart';
import 'package:developer/constants/constants.dart';
import 'package:developer/models/category.dart';
import 'package:developer/models/posts.dart';
import 'package:developer/details%20screen/detail_screen.dart';
import 'package:developer/models/warehouse.dart';
import 'package:developer/screen/stalls.dart';
import 'package:developer/screens/delivery_address.dart';
import 'package:developer/screens/sigu.dart';
import 'package:developer/screens/slider.dart';
import 'package:developer/services/fetchpost.dart';
import 'package:developer/widgets/Homepage.dart';
import 'package:developer/widgets/categories.dart';
import 'package:developer/screens/drawer.dart';
import 'package:developer/widgets/explore.dart';
import 'package:developer/widgets/post.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String id = "home";
  Widget loads() {
    return FutureBuilder(
      future: fetchPost(),
      builder: (context, snapshot) => snapshot.hasData
          ? PostWidget(post: snapshot.data)
          : Center(child: Image.asset("images/ripple.gif")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Martin Mwenda',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                'martinmwenda026@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                child: Text('M'),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(
                'My Orders',
                style: TextStyle(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text(
                'Delivery',
                style: TextStyle(),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Deliver.id);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Invite Friends'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.card_membership),
              title: Text('Become Helper'),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {},
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {},
            )
          ],
        ),
      ),
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              HomeScreen(screenHeight: MediaQuery.of(context).size.height),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Spacer(),
                          ),
                          // CircleAvatar(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: FadeIn(
                        child: Text(
                          'Explore',
                          style: headingTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) =>
                            SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              for (final category in categories)
                                CategoryWidget(category: category)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: [
                            FutureBuilder(
                                future: fetchPost(),
                                builder: (context, snapshot) => snapshot.hasData
                                    ? Posts(posts: snapshot.data)
                                    : Center(
                                        child: CircularProgressIndicator())),
                            for (final posts in posts.where((e) => e.categoryIds
                                .contains(appState.selectedCategoryId)))
                              Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Posts extends StatelessWidget {
  const Posts({
    Key key,
    this.warehouses,
    this.press,
    this.posts,
  }) : super(key: key);

  final Warehouse warehouses;
  final Function press;
  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            posts.length,
            (index) => PostWidget(
                  post: posts[index],
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Slidera(
                            post: posts[index],
                          ),
                        ));
                  },
                )));
  }
}
