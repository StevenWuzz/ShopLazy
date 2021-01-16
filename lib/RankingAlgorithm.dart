import "ShoppingList.dart";
import "AdjacencyMatrix.dart";

class Algorithm {
  static AdjacencyMatrix graph;

  static List<ShoppingList> findMatch(ShoppingList list) {
    Algorithm.graph = AdjacencyMatrix();

    return traverseGraph(list.getUserEmail());
  }

  static List<ShoppingList> traverseGraph(String email) {
    // Get Index of User Email
    int index = graph.getEmailIndex(email);

    // Get Rankings of all Users
    List<int> rankings = graph.getAdjMat()[index];

    rankings.sort();

    List<int> ordered = new List.from(rankings.reversed);

    List<ShoppingList> rankedLists;

    for (int i = 0; i < ordered.length; i++) {
      String listUser = graph.getEmail(ordered[i]);
    }

    return rankedLists;
  }
}
