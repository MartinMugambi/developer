class Post {
  final String price;
  final String id, title, subtitle, image;
  final List categoryIds;
  final List images;

  Post({
    this.id,
    this.price,
    this.title,
    this.subtitle,
    this.image,
    this.categoryIds,
    this.images,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
      categoryIds: json['categoryIds'],
      images: json['images'],
    );
  }
}

// demo category
final post = Post(
    price: "100",
    title: 'Vista Warehouse',
    subtitle: 'Find the best waehousing services',
    image: 'https://i.imgur.com/sI4GvE6.png',
    categoryIds: [0, 1]);
final pot = Post(
    price: "100",
    title: 'Vista Warehouse',
    subtitle: 'Find the best waehousing services',
    image: 'https://i.imgur.com/sI4GvE6.png',
    categoryIds: [0, 2]);
final List posts = [
  post,
  pot,
];
