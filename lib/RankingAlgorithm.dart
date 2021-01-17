import "ShoppingList.dart";
import "AdjacencyMatrix.dart";

class Algorithm {
  static AdjacencyMatrix graph;

  static List<ShoppingList> findMatch(ShoppingList list) {
    graph = AdjacencyMatrix();

    // Create adj mat
    graph.populateList();
    graph.recreateAdjMat();

    return traverseGraph(list.getUserEmail());
  }

  static List<ShoppingList> traverseGraph(String email) {
    // Get index of user email
    int index = graph.getEmailIndex(email);

    // Get rankings of all users
    List<int> rankings = graph.getAdjMat()[index];

    // Map to store initial rankings to shopping lists value
    Map<int, ShoppingList> ranksToList = Map();

    // Initialize map
    for (int i = 0; i < rankings.length; i++) {
      ranksToList[rankings[i]] = graph.getShoppingList(i);
    }

    // Sort in ascending order
    rankings.sort();

    List<ShoppingList> rankedLists;

    // Add shopping lists in order of extra items
    for (int i = 0; i < rankings.length; i++) {
      rankedLists.add(ranksToList[rankings[i]]);
    }

    return rankedLists;
  }
}
