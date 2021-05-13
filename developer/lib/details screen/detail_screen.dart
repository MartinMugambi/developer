import 'package:developer/details%20screen/explore.dart';
import 'package:developer/models/warehouse.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Warehouse warehouse;

  const Details({Key key, this.warehouse}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Warehouse> warehouses = getPlaceList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: buildPlaces(),
        ),
      ),
    );
  }

  List<Widget> buildPlaces() {
    List<Widget> list = [];
    for (var warehouse in warehouses) {
      list.add(buildPlace(warehouse));
    }
    return list;
  }

  Widget buildPlace(Warehouse warehouse) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Explore(warehouse: warehouse)));
      },
      child: Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Hero(
            tag: warehouse.images[0],
            child: Container(
              width: 230.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(warehouse.images[0]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 12.0, bottom: 12.0, right: 12.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            warehouse.description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                warehouse.country,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
