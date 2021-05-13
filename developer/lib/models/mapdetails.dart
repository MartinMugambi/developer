import 'package:google_maps_flutter/google_maps_flutter.dart';

class Detail {
  String warehouseName;
  String address;
  String description;
  String thumbnails;
  LatLng locationCoords;
  Detail({
    this.warehouseName,
    this.address,
    this.description,
    this.thumbnails,
    this.locationCoords,
  });
}

List<Detail> details = [
  Detail(
    warehouseName: 'Jumia Warehouse',
    address: 'ParkLands',
    description: 'Best Warehouse service in ParkLands',
    locationCoords: LatLng(-1.255756, 36.819154),
    thumbnails: 'images/pos.jpg',
  ),
  Detail(
    warehouseName: 'Vista Warehouse',
    address: 'Thika',
    description: 'Best Warehouse service in Nyeri area',
    locationCoords: LatLng(-1.015235, 37.088878),
    thumbnails: 'images/sma.jpg',
  ),
  Detail(
    warehouseName: 'Dev Warehouse',
    address: 'Nyeri',
    description: 'Best Warehouse service in Nyeri area',
    locationCoords: LatLng(-0.433970, 36.957020),
    thumbnails: 'images/sma.jpg',
  ),
];
