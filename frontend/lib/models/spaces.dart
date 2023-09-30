class Spaces {
  final int id;
  final String title;
  final String? description;


  Spaces({
    required this.id,
    required this.title,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,

    };
  }

  factory Spaces.fromJson(Map<String, dynamic> json) {
    return Spaces(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}