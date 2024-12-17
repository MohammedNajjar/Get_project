class Student {
  final String name;
  final String id;
  final String avg;

  Student({
    required this.name,
    required this.id,
    required this.avg,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'id': id,
      'avg': avg,
    };
  }

  factory Student.fromMap(Map<String, String> map) {
    return Student(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      avg: map['avg'] ?? '',
    );
  }
}
