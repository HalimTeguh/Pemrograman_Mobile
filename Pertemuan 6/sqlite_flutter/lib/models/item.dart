class Item {
  int? _id;

  String? _name;

  int? _price;

  //Constructor 1
  Item({required String name, required int price})
      : _name = name,
        _price = price;

  //Constructor 2
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._price = map['price'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = this._id;
    map['name'] = name;
    map['price'] = price;

    return map;
  }

  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['id'] = this._name;
    map['price'] = this._price;
    return map;
  }

  //Setter getter
  get id => _id;

  set id(value) => _id = value;

  get name => _name;

  set name(value) => _name = value;

  get price => _price;

  set price(value) => _price = value;
}
