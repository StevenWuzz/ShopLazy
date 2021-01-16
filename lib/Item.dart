class Item {
  String _name;
  int _quant;
  String _id;

  Item(this._name, this._quant, this._id);

  String getName() {
    return this._name;
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
}
