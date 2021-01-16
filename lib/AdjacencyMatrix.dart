class AdjacencyMatrix {
  static final AdjacencyMatrix _singleton = AdjacencyMatrix._internal();

  static List<List<int>> _adjMat;

  static List<String> emails;

  factory AdjacencyMatrix() {
    return _singleton;
  }

  int getEmailIndex(String email) {
    for (int i = 0; i < emails.length; i++) {
      if (emails[i] == email) {
        return i;
      }
    }
    return -1;
  }

  String getEmail(int index) {
    return emails[index];
  }

  List<List<int>> getAdjMat() {
    return AdjacencyMatrix._adjMat;
  }

  AdjacencyMatrix._internal();
}
