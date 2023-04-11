class User {
  final String id;
  final String name;
  final String? imageUrl; // 追加

  User({required this.id, required this.name, this.imageUrl}); // 修正

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        imageUrl = map['imageUrl']; // 追加

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl, // 追加
    };
  }
}
