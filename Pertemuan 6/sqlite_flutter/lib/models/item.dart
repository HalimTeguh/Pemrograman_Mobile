class Item {
  int? _id;

  String? _kdBarang;

  String? _name;

  int? _price;

  int? _stok;



  //Constructor 1
  Item({required String name, required String kdBarang, required int price, required int stok})
      : _name = name,
        _kdBarang = kdBarang,
        _price = price,
        _stok = stok;

  //Constructor 2
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._kdBarang = map['kdBarang'];
    this._price = map['price'];
    this._stok = map['stok'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = this._id;
    map['name'] = name;
    map['kdBarang'] = kdBarang;
    map['price'] = price;
    map['stok'] = stok;

    return map;
  }

  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['name'] = this._name;
    map['kdBarang'] = this._kdBarang;
    map['price'] = this._price;
    map['stok'] = this._stok;
    return map;
  }

  //Setter getter
  get id => _id;

  set id(value) => _id = value;

  get name => _name;

  set name(value) => _name = value;

  get price => _price;

  set price(value) => _price = value;

  get kdBarang => _kdBarang;

  set kdBarang(value) => _kdBarang = value;

  get stok => _stok;

  set stok(value) => _stok = value;
}
