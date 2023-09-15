class Pokemon {
  final int id;
  final String num;
  final String name;
  final String image;
  final List<String> type;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      image: json['img'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Pokemon({
    required this.id,
    required this.num,
    required this.type,
    required this.name,
    required this.image,
  });
}
