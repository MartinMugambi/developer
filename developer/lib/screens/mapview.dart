import 'dart:async';
import 'package:developer/models/mapdetails.dart';
import 'package:developer/models/warehouse.dart';
import 'package:developer/screens/details.dart';
import 'package:developer/screens/log_screen.dart';
import 'package:developer/screens/sigu.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  static final String id = "map";
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition _initialPosition = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController _controller;
  final Geolocator _geolocator = Geolocator();
  Position _currentPosition;
  List<Marker> allMarkers = [];
  PageController _pageController;
  int prevPage;

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    details.forEach((element) {
      allMarkers.add(Marker(
        markerId: MarkerId(element.warehouseName),
        draggable: false,
        infoWindow:
            InfoWindow(title: element.warehouseName, snippet: element.address),
        position: element.locationCoords,
      ));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _detailsList(index) {
    Detail detail = details[index];
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 125.0,
            width: Curves.easeIn.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScro(detail: detail),
              ));
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                height: 225.0,
                width: 320.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              details[index].thumbnails,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            details[index].warehouseName,
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            details[index].address,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Container(
                            width: 108.0,
                            child: Text(
                              details[index].description,
                              style: TextStyle(
                                fontSize: 10.5,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: mapCreated,
              markers: Set.from(allMarkers),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 30.0),
              child: Positioned(
                  child: FlatButton(
                      onPressed: () {},
                      color: Colors.black87,
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ))),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: details.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _detailsList(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: details[_pageController.page.toInt()].locationCoords,
      zoom: 12.0,
      bearing: 45.0,
      tilt: 45.0,
    )));
  }
}
