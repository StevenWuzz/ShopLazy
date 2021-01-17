import "ShoppingList.dart";
import 'Item.dart';

class AdjacencyMatrix {
  // Singleton instance of adjancencyMatrix
  static final AdjacencyMatrix _singleton = AdjacencyMatrix._internal();

  // AdjMat 2D array
  static List<List<int>> _adjMat;

  // List of shopping Lists in adjMat
  static List<ShoppingList> _shoppers;

  // List of emails in adjMat
  static List<String> _emails;

  // AdjancencyMatrix constructor
  factory AdjacencyMatrix() {
    return _singleton;
  }

  void populateList() {
    _shoppers.clear();
    _emails.clear();

    // Populate shoppers from FireBase
  }

  void recreateAdjMat() {
    _adjMat.clear();

    // Calculate number of xxtra items j has over i
    for (int i = 0; i < _shoppers.length; i++) {
      for (int j = 0; j < _shoppers.length; j++) {
        // Get iterables of each shopping list
        Iterator<Item> item1 = _shoppers[i].getShoppingList();
        Iterator<Item> item2 = _shoppers[j].getShoppingList();

        int count = 0;

        // Iterate over both list of items to check for dissimilarities
        while (item2.moveNext()) {
          while (item1.moveNext()) {
            if (item1.current.getName() == item2.current.getName()) {
              break;
              // count--;
            }
          }
          count++;
        }

        // Set number of extra items for edge
        _adjMat[i][j] = count;
      }
    }
  }

  // Get index of email address in adjmat
  int getEmailIndex(String email) {
    for (int i = 0; i < _emails.length; i++) {
      if (_emails[i] == email) {
        return i;
      }
    }
    return -1;
  }

  String getEmail(int index) {
    return _emails[index];
  }

  ShoppingList getShoppingList(int index) {
    return _shoppers[index];
  }

  List<List<int>> getAdjMat() {
    return AdjacencyMatrix._adjMat;
  }

  AdjacencyMatrix._internal();
}
