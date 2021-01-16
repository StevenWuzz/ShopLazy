class Item {
  String _name;
  int _quant;
  String _id;

  Item(this._name, this._quant, this._id);

  String getName() {
    return this._name;
  }

  void setName(String name) {
    this._name = name;
  }

  int getQuant() {
    return this._quant;
  }

  void setQuant(int x) {
    this._quant = x;
  }

  String getID() {
    return this._id;
  }

  factory Vaccination.fromJson(Map<dynamic, dynamic> json) => _ItemFromJson(json);
  Map<String, dynamic> toJson() => _ItemToJson(this);
}

Item _ItemFromJson(Map<dynamic, dynamic> json) {
  return Item(
    json['name'] as String,
    json['quantity'] as int ,
    json['id'] as String,
  );
}



Map<String, dynamic> _ItemToJson(Item instance) =>
    <String, dynamic> {
      'name': instance.getName,
      'quantity': instance.getQuant,
      'id': instance.getID,
    };
