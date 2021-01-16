import "Item.dart";

class ShoppingList {
  static List<Item> shoppingList = [
    Item("Milk Chocolate", 12, "choco"),
    Item("Peanut Butter", 1, "peanutbutter"),
  ];

  String _userEmail;

  ShoppingList(this._userEmail);

  String getUserEmail() {
    return this._userEmail;
  }

  void setUserEmail(String email) {
    this._userEmail = email;
  }

  void addItem(Item item) {
    if (!shoppingList.contains(item)) {
      shoppingList.add(item);
    }
  }

  void removeItem(Item item) {
    if (shoppingList.contains(item)) {
      shoppingList.remove(item);
    }
  }

  bool editItemQuant(Item item, int newQuant) {
    if (shoppingList.contains(item)) {
      shoppingList[shoppingList.indexOf(item)].setQuant(newQuant);
      return true;
    }

    return false;
  }

  static Iterator<Item> getShoppingList() {
    return ShoppingList.shoppingList.iterator;
  }
}
