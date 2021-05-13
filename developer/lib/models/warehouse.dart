class Warehouse {
  String description;
  String country;
  double price;
  List<String> images;

  Warehouse(this.description, this.country, this.price, this.images);
}

List<Warehouse> getPlaceList() {
  return <Warehouse>[
    Warehouse(
      "Beautiful city view from top of the town",
      "Norway",
      3580.9,
      [
        "images/pos.jpg",
        "images/onboa.png",
      ],
    ),
    Warehouse(
      "The second largest city in Brazil, famous for its breathtaking landscape",
      "Brazil",
      2990,
      [
        "images/sma.jpg",
      ],
    ),
    Warehouse(
      "This city has been described as the cultural, financial, and media capital of the world",
      "USA",
      4870.5,
      [
        "images/smal.jpg",
      ],
    ),
  ];
}
