class AdjacencyMatrix {
  static final AdjacencyMatrix _singleton = AdjacencyMatrix._internal();

  static List<List<String>> shoppingList;

  factory AdjacencyMatrix() {
    return _singleton;
  }

  AdjacencyMatrix._internal();
}
