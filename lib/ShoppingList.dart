import "Item.dart";

class ShoppingList {
  List<Item> shoppingList;

  ShoppingList();

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

  Iterator<Item> getShoppingList() {
    return this.shoppingList.iterator;
  }
}
