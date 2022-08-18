class Item {
  final int id;
  final String name;
  final String desc;
  final String image;
  final num price;
  final String color;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.image,
      required this.price,
      required this.color});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      image: map['image'],
      price: map['price'],
      color: map['color'],
    );
  }

  toMap() => {
        'id': id,
        'name': name,
        'desc': desc,
        'image': image,
        'price': price,
        'color': color,
      };
}

class CatalogModel {
  static List<Item> items = [];
  // = [
  //   Item(
  //       id: 1,
  //       name: 'iPhone 12 Pro',
  //       desc: 'iPhone 12 Pro is the latest in the iPhone series.',
  //       image: 'https://pngimg.com/uploads/iphone_12/iphone_12_PNG19.png',
  //       price: 999.99,
  //       color: 'red')
  // ];
}
