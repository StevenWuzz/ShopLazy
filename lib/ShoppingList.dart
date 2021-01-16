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

  // factory ShoppingList.fromjson
  //
  // (
  //
  // Map<String, dynamic>
  //
  // )
  //
  // fromJson() => _ShoppngListFromJson(json);
  //
  // Map<String, dynamic> toJson() => _ShoppingListToJson(this);

}
//
// ShoppingList _ShoppingListFromJson(Map<String, dynamic> json) {
//   ShoppingList sl = new ShoppingList();
//   (json['Items'] as List).forEach(item){
//     sl.add(Item.fromJson(item))
//   }
// }
//
//
// Map<String, dynamic> _ShoppingListToJson(ShoppingListToJson sl) =>
//     <String, dynamic>{
//       'user': sl.getUserEmail,
//       'vaccinations': _ItemList(sl.getShoppingList),
//     };
//
//
// List<Map<String, dynamic>> _ItemList(Iterator<Item> items) {
//   if (!items.moveNext()) {
//     return null;
//   }
//   List<Map<String, dynamic>> itemMap = List<Map<String, dynamic>>();
//   do {
//     itemmap.add(items.current.toJson)
//   } while (items.movenext());
//   return itemMap;
// }